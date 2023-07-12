package output

import (
	"encoding/json"
	"fmt"
	"sort"
	"strings"

	"github.com/fatih/color"
	"golang.org/x/text/cases"
	"golang.org/x/text/language"

	"github.com/trufflesecurity/trufflehog/v3/pkg/detectors"
	"github.com/trufflesecurity/trufflehog/v3/pkg/pb/source_metadatapb"
)

var (
	yellowPrinter = color.New(color.FgYellow)
	greenPrinter  = color.New(color.FgHiGreen)
	whitePrinter  = color.New(color.FgWhite)
)

func PrintPlainOutput(r *detectors.ResultWithMetadata) error {
	out := outputFormat{
		DetectorType: r.Result.DetectorType.String(),
		DecoderType:  r.Result.DecoderType.String(),
		Verified:     r.Result.Verified,
		MetaData:     r.SourceMetadata,
		Raw:          strings.TrimSpace(string(r.Result.Raw)),
	}

	meta, err := structToMap(out.MetaData.Data)
	if err != nil {
		return fmt.Errorf("could not marshal result: %w", err)
	}

	printer := greenPrinter

	if out.Verified {
		yellowPrinter.Print("Found verified result 🐷🔑\n")
	} else {
		printer = whitePrinter
		whitePrinter.Print("Found unverified result 🐷🔑❓\n")
	}
	printer.Printf("Detector Type: %s\n", out.DetectorType)
	printer.Printf("Decoder Type: %s\n", out.DecoderType)
	printer.Printf("Raw result: %s\n", whitePrinter.Sprint(out.Raw))

	for k, v := range r.Result.ExtraData {
		printer.Printf(
			"%s: %v\n",
			cases.Title(language.AmericanEnglish).String(k),
			v)
	}

	if r.Result.StructuredData != nil {
		for idx, v := range r.Result.StructuredData.GithubSshKey {
			printer.Printf("GithubSshKey %d User: %s\n", idx, v.User)

			if v.PublicKeyFingerprint != "" {
				printer.Printf("GithubSshKey %d Fingerprint: %s\n", idx, v.PublicKeyFingerprint)
			}
		}

		for idx, v := range r.Result.StructuredData.TlsPrivateKey {
			printer.Printf("TlsPrivateKey %d Fingerprint: %s\n", idx, v.CertificateFingerprint)
			printer.Printf("TlsPrivateKey %d Verification URL: %s\n", idx, v.VerificationUrl)
			printer.Printf("TlsPrivateKey %d Expiration: %d\n", idx, v.ExpirationTimestamp)
		}
	}

	aggregateData := make(map[string]interface{})
	var aggregateDataKeys []string

	for _, data := range meta {
		for k, v := range data {
			aggregateDataKeys = append(aggregateDataKeys, k)
			aggregateData[k] = v
		}
	}
	sort.Strings(aggregateDataKeys)
	for _, k := range aggregateDataKeys {
		printer.Printf("%s: %v\n", cases.Title(language.AmericanEnglish).String(k), aggregateData[k])
	}
	fmt.Println("")
	return nil
}

func structToMap(obj interface{}) (m map[string]map[string]interface{}, err error) {
	data, err := json.Marshal(obj)
	if err != nil {
		return
	}
	err = json.Unmarshal(data, &m)
	return
}

type outputFormat struct {
	DetectorType,
	DecoderType string
	Verified bool
	Raw      string
	*source_metadatapb.MetaData
}
