# filebrowser Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1000 |
| Working directory | - |
| Entrypoint | tini -- /init.sh --config /config/settings.json |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | GID=1000PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE=/etc/ssl/c... |
