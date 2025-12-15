# spark-iamguarded Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | /opt/iamguarded/spark |
| Entrypoint | /opt/iamguarded/scripts/spark/entrypoint.sh |
| CMD | /opt/iamguarded/scripts/spark/run.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | JAVA_HOME=/usr/lib/jvm/java-17-openjdkLIBNSS_WRAPPER_PATH=PATH=/opt/iamguarded/spark/bin:/opt/iam... |
