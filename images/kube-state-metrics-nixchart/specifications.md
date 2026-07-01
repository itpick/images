# kube-state-metrics-nixchart Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1001 |
| Working directory | /opt/iamguarded/kube-state-metrics |
| Entrypoint | kube-state-metrics --port=8080 --telemetry-port=8081 |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/opt/iamguarded/kube-state-metrics/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sb... |
