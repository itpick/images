# camunda-keycloak-fips Specifications

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
| Environment variables | CLASSPATH=/usr/share/java/bouncycastle-fips/bc-fips.jar:/opt/iamguarded/keycloak/providers/*:/opt... |
