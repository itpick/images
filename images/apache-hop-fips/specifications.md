# apache-hop-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | /home/hop |
| Entrypoint | /bin/bash /opt/hop/run.sh |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | CLASSPATH=/usr/share/java/bouncycastle-fips/*:/opt/hop/lib/fips/*:./*:.DEPLOYMENT_PATH=/opt/hopHO... |
