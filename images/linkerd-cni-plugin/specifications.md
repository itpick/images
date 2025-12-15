# linkerd-cni-plugin Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 0 |
| Working directory | /linkerd |
| Entrypoint | - |
| CMD | install-cni.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/linkerd:/opt/cni/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/binSSL_CERT_F... |
