# cert-manager-controller-iamguarded Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1001 |
| Working directory | /opt/iamguarded/cert-manager |
| Entrypoint | /opt/iamguarded/cert-manager/bin/cert-manager |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | APP_VERSION=1.19.1PATH=/opt/iamguarded/cert-manager/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:... |
