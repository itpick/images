# headlamp-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | / |
| Entrypoint | /headlamp/headlamp-server -html-static-dir /headlamp/frontend -plugins-dir /headlamp/plugins |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | HEADLAMP_STATIC_PLUGINS_DIR=/headlamp/static-pluginsPATH=/usr/local/sbin:/usr/local/bin:/usr/bin:... |
