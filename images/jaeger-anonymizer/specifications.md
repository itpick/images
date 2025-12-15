# jaeger-anonymizer Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1000 |
| Working directory | / |
| Entrypoint | /go/bin/anonymizer-linux |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/binSSL_CERT_FILE=/etc/ssl/certs/ca-... |
