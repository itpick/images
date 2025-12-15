# influxdb-iamguarded Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | - |
| Entrypoint | /opt/iamguarded/scripts/influxdb/entrypoint.sh |
| CMD | /opt/iamguarded/scripts/influxdb/run.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | APP_VERSION=IAMGUARDED_APP_NAME=influxdbPATH=/opt/iamguarded/common/bin:/opt/iamguarded/influxdb/... |
