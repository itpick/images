# prometheus-nixchart Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1001 |
| Working directory | - |
| Entrypoint | /opt/iamguarded/prometheus/bin/prometheus |
| CMD | --config.file=/opt/iamguarded/prometheus/conf/prometheus.yml --storage.tsdb.path=/opt/iamguarded/... |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/opt/iamguarded/prometheus/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/binS... |
