# jetty Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 999 |
| Working directory | /var/lib/jetty |
| Entrypoint | /docker-entrypoint.sh |
| CMD | java -jar /usr/local/jetty/start.jar |
| Volumes | - |
| Stop signal | - |
| Environment variables | JAVA_HOME=/usr/lib/jvm/default-jvmJAVA_VERSION=jdk-21JETTY_BASE=/var/lib/jettyJETTY_HOME=/usr/loc... |
