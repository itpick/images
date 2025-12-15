# kafka-bridge-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | /opt/strimzi |
| Entrypoint | - |
| CMD | /opt/strimzi/bin/kafka_bridge_run.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | JAVA_HOME=/usr/lib/jvm/default-jvmPATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/b... |
