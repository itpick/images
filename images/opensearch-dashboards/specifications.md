# opensearch-dashboards Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | /usr/share/opensearch-dashboards |
| Entrypoint | /usr/bin/dumb-init -- |
| CMD | /usr/share/opensearch-dashboards/opensearch-dashboards-docker-entrypoint.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | OPENSEARCH_DASHBOARDS_HOME=/usr/share/opensearch-dashboardsOSD_NODE_HOME=/usrPATH=/usr/local/sbin... |
