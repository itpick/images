# dnsdist Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 953 |
| Working directory | /etc/dnsdist |
| Entrypoint | /usr/bin/tini -- /usr/local/bin/dnsdist-startup |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE=/etc/ssl/certs/ca-... |
