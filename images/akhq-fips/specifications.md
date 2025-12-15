# akhq-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | /usr/share/java/akhq |
| Entrypoint | docker-entrypoint.sh |
| CMD | /usr/share/java/akhq/akhq |
| Volumes | - |
| Stop signal | - |
| Environment variables | JAVA_HOME=/usr/lib/jvm/java-17-openjdkMICRONAUT_CONFIG_FILES=/usr/share/java/akhq/application.yml... |
