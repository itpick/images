# grafana Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | /usr/share/grafana |
| Entrypoint | /opt/grafana/run.sh |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | GF_PATHS_CONFIG=/etc/grafana/grafana.iniGF_PATHS_DATA=/var/lib/grafanaGF_PATHS_HOME=/usr/share/gr... |
