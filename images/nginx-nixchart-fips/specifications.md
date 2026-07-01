# nginx-nixchart-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | /app |
| Entrypoint | /opt/iamguarded/scripts/nginx/entrypoint.sh |
| CMD | /opt/iamguarded/scripts/nginx/run.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | APP_VERSION=PATH=/opt/iamguarded/common/bin:/opt/iamguarded/nginx/sbin:/usr/local/sbin:/usr/local... |
