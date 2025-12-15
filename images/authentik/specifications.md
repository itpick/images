# authentik Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | / |
| Entrypoint | dumb-init -- ak |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | HOME=/authentikLANG=C.UTF-8PATH=/lifecycle:/ak-root/venv/bin:/usr/local/sbin:/usr/local/bin:/usr/... |
