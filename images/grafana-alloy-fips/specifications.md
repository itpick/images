# grafana-alloy-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 473 |
| Working directory | - |
| Entrypoint | /bin/alloy |
| CMD | run /etc/alloy/config.alloy --storage.path=/var/lib/alloy/data |
| Volumes | - |
| Stop signal | - |
| Environment variables | ALLOY_DEPLOY_MODE=dockerPATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT... |
