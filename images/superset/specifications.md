# superset Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | /app |
| Entrypoint | - |
| CMD | /app/docker/entrypoints/docker-ci.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | FLASK_APP=superset.app:create_app()HOME=/app/superset_homeLANG=C.UTF-8LC_ALL=C.UTF-8PATH=/usr/sha... |
