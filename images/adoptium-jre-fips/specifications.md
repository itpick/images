# adoptium-jre-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 65532 |
| Working directory | /app |
| Entrypoint | /usr/bin/java |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | CLASSPATH=/usr/share/java/bouncycastle-fips/*:./*:.JAVA_FIPS_CLASSPATH=/usr/share/java/bouncycast... |
