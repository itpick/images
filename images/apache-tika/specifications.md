# apache-tika Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | - |
| Working directory | - |
| Entrypoint | /bin/sh -c exec java -cp "/tika-server-standard.jar:/tika-extras/*" org.apache.tika.server.core.T... |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/binSSL_CERT_FILE=/etc/ssl/certs/ca-... |
