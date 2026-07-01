# kibana-nixchart-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | - |
| Entrypoint | /opt/iamguarded/scripts/kibana/entrypoint.sh |
| CMD | /opt/iamguarded/scripts/kibana/run.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/opt/iamguarded/common/bin:/opt/iamguarded/kibana/bin:/usr/local/sbin:/usr/local/bin:/usr/sb... |
