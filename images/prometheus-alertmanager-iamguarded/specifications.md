# prometheus-alertmanager-iamguarded Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1001 |
| Working directory | /opt/iamguarded/alertmanager |
| Entrypoint | /opt/iamguarded/alertmanager/bin/alertmanager |
| CMD | --config.file=/opt/iamguarded/alertmanager/conf/config.yml --storage.path=/opt/iamguarded/alertma... |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/opt/iamguarded/alertmanager/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bi... |
