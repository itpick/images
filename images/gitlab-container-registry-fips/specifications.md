# gitlab-container-registry-fips Specifications

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
| Environment variables | CONFIG_DIRECTORY=/etc/docker/registryCONFIG_FILENAME=config.ymlCONFIG_TEMPLATE_DIRECTORY=/etc/con... |
