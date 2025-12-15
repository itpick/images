# git-iamguarded Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | - |
| Entrypoint | /opt/iamguarded/scripts/git/entrypoint.sh |
| CMD | /bin/bash |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/opt/iamguarded/git/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/binSSL_CERT... |
