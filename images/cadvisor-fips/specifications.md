# cadvisor-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 0 |
| Working directory | - |
| Entrypoint | /usr/bin/cadvisor |
| CMD | -logtostderr |
| Volumes | - |
| Stop signal | - |
| Environment variables | CADVISOR_HEALTHCHECK_URL=http://localhost:8080/healthzLD_PRELOAD=PATH=/usr/local/sbin:/usr/local/... |
