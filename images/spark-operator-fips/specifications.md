# spark-operator-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | - |
| Entrypoint | /usr/bin/entrypoint.sh |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | CLASSPATH=/usr/share/java/bouncycastle-fips/*:./*:.JAVA_HOME=/usr/lib/jvm/default-jvmJAVA_TOOL_OP... |
