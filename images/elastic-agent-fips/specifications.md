# elastic-agent-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | /usr/share/elastic-agent |
| Entrypoint | /usr/local/bin/docker-entrypoint |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/usr/share/elastic-agent:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/binSSL_CER... |
