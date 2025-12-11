# datadog-agent Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 0 |
| Working directory | - |
| Entrypoint | - |
| CMD | /bin/entrypoint.sh |
| Volumes | /var/log/datadog/var/run/s6 |
| Stop signal | - |
| Environment variables | CURL_CA_BUNDLE=/opt/datadog-agent/embedded/ssl/certs/cacert.pemDD_SECRET_BACKEND_COMMAND_ALLOW_GR... |
