# dogstatsd Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | - |
| Entrypoint | /entrypoint.sh |
| CMD | /dogstatsd -c /etc/datadog-agent/ start |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/binSSL_CERT_FILE=/etc/ssl/certs/ca-... |
