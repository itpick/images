# cert-manager-cainjector-iamguarded Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1001 |
| Working directory | /opt/iamguarded/cainjector |
| Entrypoint | /opt/iamguarded/cainjector/bin/cainjector |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | APP_VERSION=1.19.1PATH=/opt/iamguarded/cainjector/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/u... |
