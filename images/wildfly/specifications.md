# wildfly Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | /opt/jboss |
| Entrypoint | /opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | JAVA_HOME=/usr/lib/jvm/default-jvmLANG=en_US.UTF-8PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/u... |
