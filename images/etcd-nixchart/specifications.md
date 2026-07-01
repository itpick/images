# etcd-nixchart Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | - |
| Entrypoint | /opt/iamguarded/scripts/etcd/entrypoint.sh |
| CMD | /opt/iamguarded/scripts/etcd/run.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/opt/iamguarded/etcd/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/binSSL_CER... |
