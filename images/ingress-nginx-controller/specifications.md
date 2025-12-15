# ingress-nginx-controller Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 0 |
| Working directory | /etc/nginx |
| Entrypoint | /nginx-ingress-controller |
| CMD | /usr/bin/dumb-init --- |
| Volumes | - |
| Stop signal | - |
| Environment variables | LUA_CPATH=/usr/lib/lua/5.1/?.so;/usr/lib/lua/?/?.so;/usr/lib/lua/?.so;/usr/lib/lua/?.lua;LUA_PATH... |
