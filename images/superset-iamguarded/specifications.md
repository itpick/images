# superset-iamguarded Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | - |
| Entrypoint | /opt/iamguarded/scripts/superset/entrypoint.sh |
| CMD | /opt/iamguarded/scripts/superset/run.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | APP_VERSION=5.0.0FLASK_APP=superset.app:create_app()HOME=/PATH=/opt/iamguarded/python/bin:/usr/sh... |
