# apisix-ingress-controller Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 65532 |
| Working directory | /ingress-apisix |
| Entrypoint | /ingress-apisix/apisix-ingress-controller |
| CMD | ingress --config-path /app/conf/config.yaml |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE=/etc/ssl/certs/ca-... |
