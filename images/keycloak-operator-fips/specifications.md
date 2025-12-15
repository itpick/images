# keycloak-operator-fips Specifications

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
| Environment variables | CLASSPATH=/usr/share/java/bouncycastle-fips/*:./*:.JAVA_FIPS_CLASSPATH=/usr/share/java/bouncycast... |
