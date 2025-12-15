# gitea-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | - |
| Entrypoint | dumb-init -- /usr/local/bin/docker-entrypoint.sh |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | GITEA_APP_INI=/etc/gitea/app.iniGITEA_CUSTOM=/var/lib/gitea/customGITEA_TEMP=/tmp/giteaGITEA_WORK... |
