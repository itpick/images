# keycloak-config-cli-nixchart-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | /opt/iamguarded/keycloak-config-cli |
| Entrypoint | /bin/bash -o errexit -o nounset -o pipefail -c java -jar ./keycloak-config-cli.jar |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | CLASSPATH=/usr/share/java/bouncycastle-fips/*HOME=/JAVA_TOOL_OPTIONS=--module-path=/usr/share/jav... |
