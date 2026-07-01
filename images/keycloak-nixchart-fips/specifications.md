# keycloak-nixchart-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | - |
| Entrypoint | /opt/iamguarded/scripts/keycloak/entrypoint.sh |
| CMD | /opt/iamguarded/scripts/keycloak/run.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | CLASSPATH=/opt/iamguarded/keycloak/providers/*:/opt/iamguarded/keycloak/bin/client/*:./*:.HOME=/J... |
