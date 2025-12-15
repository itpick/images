# nginx-s3-gateway-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 101 |
| Working directory | - |
| Entrypoint | /docker-entrypoint.sh |
| CMD | nginx -g daemon off; |
| Volumes | - |
| Stop signal | - |
| Environment variables | CORS_ALLOW_PRIVATE_NETWORK_ACCESS=CORS_ENABLED=0DIRECTORY_LISTING_PATH_PREFIX=DYNPKG_RELEASE=1NGI... |
