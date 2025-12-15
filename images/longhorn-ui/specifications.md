# longhorn-ui Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 499 |
| Working directory | /web |
| Entrypoint | - |
| CMD | /usr/local/bin/start-nginx.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | LONGHORN_MANAGER_IP=http://localhost:9500LONGHORN_UI_PORT=8000PATH=/usr/local/sbin:/usr/local/bin... |
