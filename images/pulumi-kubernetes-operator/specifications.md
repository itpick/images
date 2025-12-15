# pulumi-kubernetes-operator Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 0 |
| Working directory | - |
| Entrypoint | /sbin/tini -- /usr/bin/pulumi-kubernetes-operator |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | LANG=C.UTF-8PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE=/etc/s... |
