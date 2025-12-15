# docker-dind Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 0 |
| Working directory | - |
| Entrypoint | /usr/bin/dockerd-entrypoint.sh |
| CMD | - |
| Volumes | /var/lib/docker |
| Stop signal | - |
| Environment variables | DOCKER_BUILDX_VERSION=${local.docker_buildx_package_version_without_epoch}DOCKER_COMPOSE_VERSION=... |
