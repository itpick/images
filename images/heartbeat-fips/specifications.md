# heartbeat-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | /usr/share/heartbeat |
| Entrypoint | /usr/bin/tini -- /usr/local/bin/docker-entrypoint |
| CMD | --environment container |
| Volumes | - |
| Stop signal | - |
| Environment variables | ELASTIC_CONTAINER=trueGODEBUG=madvdontneed=1LIBBEAT_MONITORING_CGROUPS_HIERARCHY_OVERRIDE=/PATH=/... |
