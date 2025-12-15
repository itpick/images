# metrics-server-iamguarded-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1001 |
| Working directory | /opt/iamguarded/metrics-server |
| Entrypoint | metrics-server --secure-port=8443 --cert-dir=/opt/iamguarded/metrics-server/certificates |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/opt/iamguarded/metrics-server/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/... |
