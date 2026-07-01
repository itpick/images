# haproxy-nixchart-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | - |
| Entrypoint | /opt/iamguarded/haproxy/bin/haproxy |
| CMD | -f /iamguarded/haproxy/conf/haproxy.cfg |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/opt/iamguarded/haproxy-dataplaneapi/bin:/opt/iamguarded/haproxy/bin:/opt/iamguarded/lua/bin... |
