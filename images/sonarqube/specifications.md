# sonarqube Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | /opt/sonarqube |
| Entrypoint | bash |
| CMD | -c /opt/sonarqube/docker/entrypoint.sh |
| Volumes | - |
| Stop signal | SIGINT |
| Environment variables | JAVA_HOME=/usr/lib/jvm/java-17-openjdkPATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbi... |
