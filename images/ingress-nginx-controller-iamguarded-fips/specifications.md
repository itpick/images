# ingress-nginx-controller-iamguarded-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | /etc/nginx |
| Entrypoint | /nginx-ingress-controller |
| CMD | /usr/bin/dumb-init --- |
| Volumes | - |
| Stop signal | - |
| Environment variables | LD_LIBRARY_PATH=/lib:/modules_mount/etc/nginx/modules/otel:/usr/lib:/usr/local/lib:$LD_LIBRARY_PA... |
