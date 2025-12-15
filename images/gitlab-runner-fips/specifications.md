# gitlab-runner-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 100 |
| Working directory | - |
| Entrypoint | dumb-init /entrypoint |
| CMD | run --user=gitlab-runner --working-directory=/home/gitlab-runner |
| Volumes | - |
| Stop signal | SIGQUIT |
| Environment variables | PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE=/etc/ssl/certs/ca-... |
