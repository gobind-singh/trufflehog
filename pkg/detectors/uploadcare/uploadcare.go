package uploadcare

import (
	"context"
	"fmt"
	"net/http"
	"regexp"
	"strings"

	"github.com/trufflesecurity/trufflehog/v3/pkg/common"
	"github.com/trufflesecurity/trufflehog/v3/pkg/detectors"
	"github.com/trufflesecurity/trufflehog/v3/pkg/pb/detectorspb"
)

type Scanner struct{}

// Ensure the Scanner satisfies the interface at compile time
var _ detectors.Detector = (*Scanner)(nil)

var (
	client = common.SaneHttpClient()

	//Make sure that your group is surrounded in boundry characters such as below to reduce false positives
	keyPat       = regexp.MustCompile(detectors.PrefixRegex([]string{"uploadcare"}) + `\b([a-z0-9]{20})\b`)
	publicKeyPat = regexp.MustCompile(detectors.PrefixRegex([]string{"uploadcare"}) + `\b([a-z0-9]{20})\b`)
)

// Keywords are used for efficiently pre-filtering chunks.
// Use identifiers in the secret preferably, or the provider name.
func (s Scanner) Keywords() []string {
	return []string{"uploadcare"}
}

// FromData will find and optionally verify UploadCare secrets in a given set of bytes.
func (s Scanner) FromData(ctx context.Context, verify bool, data []byte) (results []detectors.Result, err error) {
	dataStr := string(data)

	matches := keyPat.FindAllStringSubmatch(dataStr, -1)
	publicMatches := publicKeyPat.FindAllStringSubmatch(dataStr, -1)

	for _, match := range matches {
		if len(match) != 2 {
			continue
		}
		resMatch := strings.TrimSpace(match[1])

		for _, publicMatch := range publicMatches {
			if len(publicMatch) != 2 {
				continue
			}
			publicKeyMatch := strings.TrimSpace(publicMatch[1])
			s1 := detectors.Result{
				DetectorType: detectorspb.DetectorType_UploadCare,
				Raw:          []byte(resMatch),
			}

			if verify {
				req, _ := http.NewRequest("GET", "https://api.uploadcare.com/files/", nil)
				req.Header.Add("Accept", "application/vnd.uploadcare-v0.5+json")
				req.Header.Add("Authorization", fmt.Sprintf("Uploadcare.Simple %s:%s", publicKeyMatch, resMatch))
				res, err := client.Do(req)
				if err == nil {
					defer res.Body.Close()
					if res.StatusCode >= 200 && res.StatusCode < 300 {
						s1.Verified = true
					} else {
						//This function will check false positives for common test words, but also it will make sure the key appears 'random' enough to be a real key
						if detectors.IsKnownFalsePositive(resMatch, detectors.DefaultFalsePositives, true) {
							continue
						}
					}
				}
			}

			results = append(results, s1)
		}
	}

	return detectors.CleanResults(results), nil
}