# gitlab-shell Specifications

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
| Volumes | - |
| Stop signal | - |
| Environment variables | CONFIG_TEMPLATE_DIRECTORY=/srv/gitlab-shellHOME=/home/gitLANG=C.UTF-8PATH=/usr/local/sbin:/usr/lo... |
