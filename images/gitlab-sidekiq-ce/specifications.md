# gitlab-sidekiq-ce Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | - |
| Entrypoint | /scripts/entrypoint.sh |
| CMD | /scripts/process-wrapper |
| Volumes | /var/log/var/opt/gitlab |
| Stop signal | - |
| Environment variables | BOOTSNAP_CACHE_DIR=/srv/gitlab/bootsnapCONFIG_TEMPLATE_DIRECTORY=/srv/gitlab/configEXECJS_RUNTIME... |
