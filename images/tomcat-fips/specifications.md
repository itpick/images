# tomcat-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | /usr/local/tomcat |
| Entrypoint | /usr/local/tomcat/bin/catalina.sh |
| CMD | run |
| Volumes | - |
| Stop signal | - |
| Environment variables | CATALINA_HOME=/usr/local/tomcatCLASSPATH=/usr/share/java/bouncycastle-fips/*:./*:.JAVA_HOME=/usr/... |
