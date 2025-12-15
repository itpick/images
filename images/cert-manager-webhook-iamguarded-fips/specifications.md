# cert-manager-webhook-iamguarded-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1001 |
| Working directory | /opt/iamguarded/cert-manager-webhook |
| Entrypoint | /opt/iamguarded/cert-manager-webhook/bin/cert-manager-webhook |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | APP_VERSION=1.19.1PATH=/opt/iamguarded/cert-manager-webhook/bin:/usr/local/sbin:/usr/local/bin:/u... |
