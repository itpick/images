# argocd-repo-server-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 999 |
| Working directory | /home/argocd |
| Entrypoint | /usr/local/bin/argocd-repo-server |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | ARGOCD_GPG_ENABLED=falsePATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT... |
