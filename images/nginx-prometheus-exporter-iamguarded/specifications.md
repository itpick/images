# nginx-prometheus-exporter-iamguarded Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1001 |
| Working directory | /opt/iamguarded/nginx-exporter |
| Entrypoint | /usr/bin/nginx-prometheus-exporter |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | APP_VERSION=IAMGUARDED_APP_NAME=nginx-exporterPATH=/opt/iamguarded/nginx-exporter/bin:/usr/bin:$P... |
