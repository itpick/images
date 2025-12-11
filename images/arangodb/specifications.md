# arangodb Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 0 |
| Working directory | / |
| Entrypoint | /entrypoint.sh |
| CMD | arangod |
| Volumes | /var/lib/arangodb3-apps/var/lib/arangodb3 |
| Stop signal | - |
| Environment variables | ARANGO_VERSION=3.12.7GLIBCXX_FORCE_NEW=1PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/s... |
