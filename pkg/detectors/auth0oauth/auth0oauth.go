package auth0oauth

import (
	"context"
	// "fmt"
	// "log"
	"regexp"
	"strings"

	"io/ioutil"
	"net/http"
	"net/url"

	"github.com/trufflesecurity/trufflehog/pkg/common"
	"github.com/trufflesecurity/trufflehog/pkg/detectors"
	"github.com/trufflesecurity/trufflehog/pkg/pb/detectorspb"
)

type Scanner struct{}

// Ensure the Scanner satisfies the interface at compile time
var _ detectors.Detector = (*Scanner)(nil)

var (
	client = common.SaneHttpClient()

	clientIdPat     = regexp.MustCompile(detectors.PrefixRegex([]string{"auth0"}) + `\b([a-zA-Z0-9_-]{32,60})\b`)
	clientSecretPat = regexp.MustCompile(`\b([a-zA-Z0-9_-]{64,})\b`)
	domainPat       = regexp.MustCompile(`\b([a-zA-Z0-9][a-zA-Z0-9._-]*auth0.com)\b`) // could be part of url
)

// Keywords are used for efficiently pre-filtering chunks.
// Use identifiers in the secret preferably, or the provider name.
func (s Scanner) Keywords() []string {
	return []string{"auth0"}
}

// FromData will find and optionally verify Auth0oauth secrets in a given set of bytes.
func (s Scanner) FromData(ctx context.Context, verify bool, data []byte) (results []detectors.Result, err error) {
	dataStr := string(data)

	clientIdMatches := clientIdPat.FindAllStringSubmatch(dataStr, -1)
	clientSecretMatches := clientSecretPat.FindAllStringSubmatch(dataStr, -1)
	domainMatches := domainPat.FindAllStringSubmatch(dataStr, -1)

	for _, clientIdMatch := range clientIdMatches {
		if len(clientIdMatch) != 2 {
			continue
		}
		clientIdRes := strings.TrimSpace(clientIdMatch[1])

		for _, clientSecretMatch := range clientSecretMatches {
			if len(clientSecretMatch) != 2 {
				continue
			}
			clientSecretRes := strings.TrimSpace(clientSecretMatch[1])

			for _, domainMatch := range domainMatches {
				if len(domainMatch) != 2 {
					continue
				}
				domainRes := strings.TrimSpace(domainMatch[1])

				s1 := detectors.Result{
					DetectorType: detectorspb.DetectorType_Auth0oauth,
					Redacted:     clientIdRes,
					Raw:          []byte(clientSecretRes),
				}

				if verify {
					/*
					   curl --request POST \
					     --url 'https://YOUR_DOMAIN/oauth/token' \
					     --header 'content-type: application/x-www-form-urlencoded' \
					     --data 'grant_type=authorization_code&client_id=W44JmL3qD6LxHeEJyKe9lMuhcwvPOaOq&client_secret=YOUR_CLIENT_SECRET&code=AUTHORIZATION_CODE&redirect_uri=undefined'
					*/

					data := url.Values{}
					data.Set("grant_type", "authorization_code")
					data.Set("client_id", clientIdRes)
					data.Set("client_secret", clientSecretRes)
					data.Set("code", "AUTHORIZATION_CODE")
					data.Set("redirect_uri", "undefined")

					req, _ := http.NewRequest(http.MethodPost, "https://"+domainRes+"/oauth/token", strings.NewReader(data.Encode())) // URL-encoded payload
					req.Header.Add("Content-Type", "application/x-www-form-urlencoded")
					res, err := client.Do(req)
					if err == nil {
						defer res.Body.Close()
						bodyBytes, _ := ioutil.ReadAll(res.Body)
						body := string(bodyBytes)

						// if client_id and client_secret is valid -> 403 {"error":"invalid_grant","error_description":"Invalid authorization code"}
						// if invalid -> 401 {"error":"access_denied","error_description":"Unauthorized"}
						// ingenious!

						if !strings.Contains(body, "access_denied") {
							s1.Verified = true
						} else {
							if detectors.IsKnownFalsePositive(clientIdRes, detectors.DefaultFalsePositives, true) {
								continue
							}
						}

					}
				}

				results = append(results, s1)
			}
		}
	}

	return detectors.CleanResults(results), nil
}