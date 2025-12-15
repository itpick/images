# gitlab-pages-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | - |
| Entrypoint | /scripts/entrypoint.sh |
| CMD | /scripts/start-pages |
| Volumes | - |
| Stop signal | - |
| Environment variables | CONFIG_TEMPLATE_DIRECTORY=/etc/gitlab-pagesHOME=/home/gitLANG=C.UTF-8PATH=/usr/local/sbin:/usr/lo... |
