# oauth2-proxy-iamguarded-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1001 |
| Working directory | /opt/iamguarded/oauth2-proxy |
| Entrypoint | oauth2-proxy |
| CMD | --upstream=http://0.0.0.0:8080/ --http-address=0.0.0.0:4180 |
| Volumes | - |
| Stop signal | - |
| Environment variables | HOME=/LANG=en_US.UTF-8PATH=/opt/iamguarded/oauth2-proxy/bin:/usr/local/sbin:/usr/local/bin:/usr/s... |
