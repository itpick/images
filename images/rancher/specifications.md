# rancher Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 0 |
| Working directory | /var/lib/rancher |
| Entrypoint | entrypoint.sh |
| CMD | - |
| Volumes | /var/log/var/lib/cni/var/lib/kubelet/var/lib/rancher |
| Stop signal | - |
| Environment variables | AUDIT_LEVEL=0AUDIT_LOG_MAXAGE=10AUDIT_LOG_MAXBACKUP=10AUDIT_LOG_MAXSIZE=100AUDIT_LOG_PATH=/var/lo... |
