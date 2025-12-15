# kafbat-ui Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 100 |
| Working directory | / |
| Entrypoint | java --add-opens java.rmi/javax.rmi.ssl=ALL-UNNAMED -jar api.jar |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | JAVA_HOME=/usr/lib/jvm/default-jvmJAVA_OPTS=LANG=C.UTF-8PATH=/usr/local/sbin:/usr/local/bin:/usr/... |
