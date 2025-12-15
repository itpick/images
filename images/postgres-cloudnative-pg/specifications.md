# postgres-cloudnative-pg Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 26 |
| Working directory | /home/postgres |
| Entrypoint | /usr/bin/docker-entrypoint.sh postgres |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | LANG=en_US.UTF-8PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binPGDATA=/var/lib/... |
