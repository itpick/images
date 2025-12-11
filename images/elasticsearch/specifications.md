# elasticsearch Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | /usr/share/elasticsearch |
| Entrypoint | /sbin/tini -- /usr/bin/docker-entrypoint.sh |
| CMD | eswrapper |
| Volumes | - |
| Stop signal | - |
| Environment variables | ES_JAVA_HOME=/usr/lib/jvm/default-jvmPATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin... |
