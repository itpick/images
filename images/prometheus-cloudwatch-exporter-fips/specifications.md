# prometheus-cloudwatch-exporter-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | - |
| Entrypoint | /usr/bin/java --module-path=/usr/share/java/bouncycastle-fips -jar /usr/share/java/cloudwatch_exp... |
| CMD | /config/config.yml |
| Volumes | - |
| Stop signal | - |
| Environment variables | JDK_JAVA_OPTIONS=-Djavax.net.ssl.trustStoreType=FIPSPATH=/usr/local/sbin:/usr/local/bin:/usr/bin:... |
