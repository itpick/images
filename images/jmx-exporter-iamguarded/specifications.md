# jmx-exporter-iamguarded Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 65532 |
| Working directory | /opt/iamguarded/jmx-exporter |
| Entrypoint | java -jar jmx_prometheus_standalone.jar |
| CMD | 5556 examples/standalone_sample_config.yml |
| Volumes | - |
| Stop signal | - |
| Environment variables | IAMGUARDED_APP_NAME=jmx-exporterPATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin... |
