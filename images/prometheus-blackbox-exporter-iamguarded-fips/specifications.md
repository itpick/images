# prometheus-blackbox-exporter-iamguarded-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 65532 |
| Working directory | /opt/iamguarded/blackbox-exporter |
| Entrypoint | /opt/iamguarded/blackbox-exporter/bin/blackbox_exporter |
| CMD | --config.file=/etc/blackbox_exporter/config.yml |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/opt/iamguarded/blackbox-exporter/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbi... |
