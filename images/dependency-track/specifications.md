# dependency-track Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | /usr/share/java/dependency-track |
| Entrypoint | - |
| CMD | sh -c exec java ${JAVA_OPTIONS} ${EXTRA_JAVA_OPTIONS} --add-opens java.base/java.util.concurrent=... |
| Volumes | - |
| Stop signal | - |
| Environment variables | CONTEXT=/DEFAULT_TEMPLATES_OVERRIDE_BASE_DIRECTORY=/dataDEFAULT_TEMPLATES_OVERRIDE_ENABLED=falseE... |
