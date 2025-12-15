# keycloak-operator Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1000 |
| Working directory | /opt/keycloak |
| Entrypoint | java -Djava.util.logging.manager=org.jboss.logmanager.LogManager -jar quarkus-run.jar |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE=/etc/ssl/certs/ca-... |
