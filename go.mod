module github.com/trufflesecurity/trufflehog/v3

go 1.20

replace github.com/jpillora/overseer => github.com/trufflesecurity/overseer v1.1.7-custom5

require (
	cloud.google.com/go/secretmanager v1.11.1
	cloud.google.com/go/storage v1.31.0
	github.com/Azure/go-autorest/autorest/azure/auth v0.5.11
	github.com/TheZeroSlave/zapsentry v1.17.0
	github.com/aws/aws-sdk-go v1.44.83
	github.com/bill-rich/disk-buffer-reader v0.1.7
	github.com/bill-rich/go-syslog v0.0.0-20220413021637-49edb52a574c
	github.com/bitfinexcom/bitfinex-api-go v0.0.0-20210608095005-9e0b26f200fb
	github.com/bradleyfalzon/ghinstallation/v2 v2.4.0
	github.com/couchbase/gocb/v2 v2.6.3
	github.com/crewjam/rfc5424 v0.1.0
	github.com/denisenkom/go-mssqldb v0.12.3
	github.com/envoyproxy/protoc-gen-validate v1.0.2
	github.com/fatih/color v1.15.0
	github.com/felixge/fgprof v0.9.3
	github.com/getsentry/sentry-go v0.22.0
	github.com/go-errors/errors v1.4.2
	github.com/go-git/go-git/v5 v5.7.0
	github.com/go-ldap/ldap/v3 v3.4.5
	github.com/go-logr/logr v1.2.4
	github.com/go-logr/zapr v1.2.4
	github.com/go-redis/redis v6.15.9+incompatible
	github.com/go-sql-driver/mysql v1.7.1
	github.com/gobwas/glob v0.2.3
	github.com/golang-jwt/jwt v3.2.2+incompatible
	github.com/google/go-cmp v0.5.9
	github.com/google/go-containerregistry v0.14.0
	github.com/google/go-github/v42 v42.0.0
	github.com/googleapis/gax-go/v2 v2.11.0
	github.com/hashicorp/go-retryablehttp v0.7.4
	github.com/jlaffaye/ftp v0.2.0
	github.com/joho/godotenv v1.5.1
	github.com/jpillora/overseer v1.1.6
	github.com/kylelemons/godebug v1.1.0
	github.com/lib/pq v1.10.9
	github.com/mattn/go-sqlite3 v1.14.17
	github.com/mholt/archiver/v4 v4.0.0-alpha.8
	github.com/patrickmn/go-cache v2.1.0+incompatible
	github.com/paulbellamy/ratecounter v0.2.0
	github.com/petar-dambovaliev/aho-corasick v0.0.0-20211021192214-5ab2d9280aa9
	github.com/pkg/errors v0.9.1
	github.com/prometheus/client_golang v1.16.0
	github.com/rabbitmq/amqp091-go v1.8.1
	github.com/sergi/go-diff v1.3.1
	github.com/stretchr/testify v1.8.4
	github.com/tailscale/depaware v0.0.0-20210622194025-720c4b409502
	github.com/xanzy/go-gitlab v0.86.0
	go.mongodb.org/mongo-driver v1.12.0
	go.uber.org/zap v1.24.0
	golang.org/x/crypto v0.11.0
	golang.org/x/exp v0.0.0-20221018205818-5c77f4b2bbd7
	golang.org/x/oauth2 v0.9.0
	golang.org/x/sync v0.3.0
	golang.org/x/text v0.11.0
	google.golang.org/api v0.130.0
	google.golang.org/protobuf v1.31.0
	gopkg.in/alecthomas/kingpin.v2 v2.2.6
	gopkg.in/h2non/gock.v1 v1.1.2
	sigs.k8s.io/yaml v1.3.0
)

require (
	cloud.google.com/go v0.110.2 // indirect
	cloud.google.com/go/compute v1.19.3 // indirect
	cloud.google.com/go/compute/metadata v0.2.3 // indirect
	cloud.google.com/go/iam v1.1.0 // indirect
	github.com/Azure/go-autorest v14.2.0+incompatible // indirect
	github.com/Azure/go-autorest/autorest v0.11.24 // indirect
	github.com/Azure/go-autorest/autorest/adal v0.9.18 // indirect
	github.com/Azure/go-autorest/autorest/azure/cli v0.4.5 // indirect
	github.com/Azure/go-autorest/autorest/date v0.3.0 // indirect
	github.com/Azure/go-autorest/logger v0.2.1 // indirect
	github.com/Azure/go-autorest/tracing v0.6.0 // indirect
	github.com/Azure/go-ntlmssp v0.0.0-20221128193559-754e69321358 // indirect
	github.com/Microsoft/go-winio v0.6.1 // indirect
	github.com/ProtonMail/go-crypto v0.0.0-20230518184743-7afd39499903 // indirect
	github.com/acomagu/bufpipe v1.0.4 // indirect
	github.com/alecthomas/template v0.0.0-20190718012654-fb15b899a751 // indirect
	github.com/alecthomas/units v0.0.0-20211218093645-b94a6e3cc137 // indirect
	github.com/andybalholm/brotli v1.0.5 // indirect
	github.com/benbjohnson/clock v1.1.0 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/bodgit/plumbing v1.2.0 // indirect
	github.com/bodgit/sevenzip v1.3.0 // indirect
	github.com/bodgit/windows v1.0.0 // indirect
	github.com/cespare/xxhash/v2 v2.2.0 // indirect
	github.com/cloudflare/circl v1.3.3 // indirect
	github.com/connesc/cipherio v0.2.1 // indirect
	github.com/containerd/stargz-snapshotter/estargz v0.14.3 // indirect
	github.com/couchbase/gocbcore/v10 v10.2.3 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/dimchansky/utfbom v1.1.1 // indirect
	github.com/docker/cli v23.0.5+incompatible // indirect
	github.com/docker/distribution v2.8.2+incompatible // indirect
	github.com/docker/docker v23.0.5+incompatible // indirect
	github.com/docker/docker-credential-helpers v0.7.0 // indirect
	github.com/dsnet/compress v0.0.1 // indirect
	github.com/emirpasic/gods v1.18.1 // indirect
	github.com/go-asn1-ber/asn1-ber v1.5.4 // indirect
	github.com/go-git/gcfg v1.5.1-0.20230307220236-3a3c6141e376 // indirect
	github.com/go-git/go-billy/v5 v5.4.1 // indirect
	github.com/go-ole/go-ole v1.2.6 // indirect
	github.com/golang-jwt/jwt/v4 v4.5.0 // indirect
	github.com/golang-sql/civil v0.0.0-20190719163853-cb61b32ac6fe // indirect
	github.com/golang-sql/sqlexp v0.1.0 // indirect
	github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da // indirect
	github.com/golang/protobuf v1.5.3 // indirect
	github.com/golang/snappy v0.0.4 // indirect
	github.com/google/go-github/v52 v52.0.0 // indirect
	github.com/google/go-querystring v1.1.0 // indirect
	github.com/google/pprof v0.0.0-20211214055906-6f57359322fd // indirect
	github.com/google/s2a-go v0.1.4 // indirect
	github.com/google/uuid v1.3.0 // indirect
	github.com/googleapis/enterprise-certificate-proxy v0.2.5 // indirect
	github.com/h2non/parth v0.0.0-20190131123155-b4df798d6542 // indirect
	github.com/hashicorp/errwrap v1.0.0 // indirect
	github.com/hashicorp/go-cleanhttp v0.5.2 // indirect
	github.com/hashicorp/go-multierror v1.1.1 // indirect
	github.com/imdario/mergo v0.3.15 // indirect
	github.com/jbenet/go-context v0.0.0-20150711004518-d14ea06fba99 // indirect
	github.com/jmespath/go-jmespath v0.4.0 // indirect
	github.com/jpillora/s3 v1.1.4 // indirect
	github.com/kevinburke/ssh_config v1.2.0 // indirect
	github.com/klauspost/compress v1.16.5 // indirect
	github.com/klauspost/pgzip v1.2.5 // indirect
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-isatty v0.0.17 // indirect
	github.com/matttproud/golang_protobuf_extensions v1.0.4 // indirect
	github.com/mitchellh/go-homedir v1.1.0 // indirect
	github.com/montanaflynn/stats v0.0.0-20171201202039-1bf9dbcd8cbe // indirect
	github.com/nwaples/rardecode/v2 v2.0.0-beta.2 // indirect
	github.com/onsi/ginkgo v1.16.5 // indirect
	github.com/onsi/gomega v1.23.0 // indirect
	github.com/opencontainers/go-digest v1.0.0 // indirect
	github.com/opencontainers/image-spec v1.1.0-rc3 // indirect
	github.com/pierrec/lz4/v4 v4.1.15 // indirect
	github.com/pjbgf/sha1cd v0.3.0 // indirect
	github.com/pkg/diff v0.0.0-20200914180035-5b29258ca4f7 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	github.com/prometheus/client_model v0.3.0 // indirect
	github.com/prometheus/common v0.42.0 // indirect
	github.com/prometheus/procfs v0.10.1 // indirect
	github.com/rogpeppe/go-internal v1.10.0 // indirect
	github.com/sirupsen/logrus v1.9.0 // indirect
	github.com/skeema/knownhosts v1.1.1 // indirect
	github.com/therootcompany/xz v1.0.1 // indirect
	github.com/ulikunitz/xz v0.5.10 // indirect
	github.com/vbatts/tar-split v0.11.3 // indirect
	github.com/xanzy/ssh-agent v0.3.3 // indirect
	github.com/xdg-go/pbkdf2 v1.0.0 // indirect
	github.com/xdg-go/scram v1.1.2 // indirect
	github.com/xdg-go/stringprep v1.0.4 // indirect
	github.com/youmark/pkcs8 v0.0.0-20181117223130-1be2e3e5546d // indirect
	github.com/yusufpapurcu/wmi v1.2.2 // indirect
	go.opencensus.io v0.24.0 // indirect
	go.uber.org/atomic v1.7.0 // indirect
	go.uber.org/multierr v1.6.0 // indirect
	go4.org v0.0.0-20200411211856-f5505b9728dd // indirect
	golang.org/x/mod v0.11.0 // indirect
	golang.org/x/net v0.12.0 // indirect
	golang.org/x/sys v0.10.0 // indirect
	golang.org/x/time v0.3.0 // indirect
	golang.org/x/tools v0.10.0 // indirect
	golang.org/x/xerrors v0.0.0-20220907171357-04be3eba64a2 // indirect
	google.golang.org/appengine v1.6.7 // indirect
	google.golang.org/genproto v0.0.0-20230530153820-e85fd2cbaebc // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20230530153820-e85fd2cbaebc // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20230629202037-9506855d4529 // indirect
	google.golang.org/grpc v1.56.1 // indirect
	gopkg.in/warnings.v0 v0.1.2 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)
