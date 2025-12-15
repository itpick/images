# code-server Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | /home/coder |
| Entrypoint | /usr/bin/entrypoint.sh --bind-addr 0.0.0.0:8080 . |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | ENTRYPOINTD=/entrypoint.dLANG=en_US.UTF-8PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/... |
