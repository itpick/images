# keycloak-config-cli Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65534 |
| Working directory | - |
| Entrypoint | /bin/sh -c exec java $JAVA_OPTS -jar /app/keycloak-config-cli.jar $0 $@ |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | IMPORT_FILES_LOCATIONS=file:/config/*JAVA_HOME=/opt/java/openjdkJAVA_OPTS=KEYCLOAK_SSL_VERIFY=tru... |
