# datadog-cluster-agent-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | - |
| Entrypoint | /entrypoint.sh |
| CMD | datadog-cluster-agent start |
| Volumes | /var/log/datadog/etc/datadog-agent/tmp |
| Stop signal | - |
| Environment variables | DD_SECRET_BACKEND_COMMAND_ALLOW_GROUP_EXEC_PERM=trueDOCKER_DD_AGENT=truePATH=/opt/datadog-agent/b... |
