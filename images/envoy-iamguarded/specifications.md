# envoy-iamguarded Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1001 |
| Working directory | /opt/iamguarded/envoy |
| Entrypoint | /opt/iamguarded/envoy/bin/envoy |
| CMD | -c /opt/iamguarded/envoy/conf/envoy.yaml |
| Volumes | - |
| Stop signal | - |
| Environment variables | ENVOY_USER=envoyPATH=/opt/iamguarded/envoy/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:... |
