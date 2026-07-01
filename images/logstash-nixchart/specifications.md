# logstash-nixchart Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | - |
| Entrypoint | /opt/iamguarded/scripts/logstash/entrypoint.sh |
| CMD | /opt/iamguarded/scripts/logstash/run.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | JAVA_HOME=/usr/lib/jvm/java-17-openjdkLS_JAVA_HOME=/usr/lib/jvm/default-jvmPATH=/opt/iamguarded/c... |
