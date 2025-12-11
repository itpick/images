# gitlab-certificates Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | - |
| Entrypoint | /scripts/entrypoint.sh |
| CMD | /scripts/bundle-certificates |
| Volumes | - |
| Stop signal | - |
| Environment variables | CONFIG_TEMPLATE_DIRECTORY=/etcPATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSS... |
