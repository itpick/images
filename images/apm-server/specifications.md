# apm-server Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 65532 |
| Working directory | /usr/share/apm-server |
| Entrypoint | /usr/share/apm-server/apm-server --environment=container |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | BEAT_STRICT_PERMS=falseELASTIC_CONTAINER=trueLIBBEAT_MONITORING_CGROUPS_HIERARCHY_OVERRIDE=/PATH=... |
