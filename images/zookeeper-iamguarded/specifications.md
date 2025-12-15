# zookeeper-iamguarded Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | - |
| Entrypoint | /opt/iamguarded/scripts/zookeeper/entrypoint.sh |
| CMD | /opt/iamguarded/scripts/zookeeper/run.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | JAVA_HOME=/usr/lib/jvm/default-jvmLANG=en_US.UTF-8PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/... |
