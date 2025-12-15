# argocd-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 999 |
| Working directory | /home/argocd |
| Entrypoint | /sbin/tini -- |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | ARGOCD_GPG_ENABLED=falsePATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT... |
