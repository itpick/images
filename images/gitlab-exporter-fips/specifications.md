# gitlab-exporter-fips Specifications

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
| Environment variables | CONFIG_DIRECTORY=/etc/gitlab-exporterCONFIG_FILENAME=gitlab-exporter.ymlCONFIG_TEMPLATE_DIRECTORY... |
