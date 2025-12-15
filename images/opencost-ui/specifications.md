# opencost-ui Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | - |
| Entrypoint | /usr/local/bin/docker-entrypoint.sh |
| CMD | nginx -g daemon off; |
| Volumes | - |
| Stop signal | - |
| Environment variables | API_PORT=9003API_SERVER=0.0.0.0BASE_URL=/modelNGINX_VERSION=1.29.3PATH=/usr/local/sbin:/usr/local... |
