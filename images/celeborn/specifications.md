# celeborn Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 10006 |
| Working directory | /opt/celeborn |
| Entrypoint | /usr/bin/tini -- |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | CELEBORN_HOME=/opt/celebornCELEBORN_JEMALLOC_PATH=/usr/lib/libjemalloc.so.2CELEBORN_PREFER_JEMALL... |
