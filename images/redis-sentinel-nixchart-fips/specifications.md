# redis-sentinel-nixchart-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | - |
| Entrypoint | /bin/bash -c /opt/iamguarded/scripts/redis-sentinel/postunpack.sh && /opt/iamguarded/scripts/redi... |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | APP_VERSION=8.4.0PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE=/... |
