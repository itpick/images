# gitlab-workhorse-ce-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | - |
| Entrypoint | /scripts/entrypoint.sh |
| CMD | /scripts/start-workhorse |
| Volumes | - |
| Stop signal | - |
| Environment variables | CONFIG_TEMPLATE_DIRECTORY=/etcLANG=C.UTF-8PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:... |
