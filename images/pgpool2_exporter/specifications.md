# pgpool2_exporter Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | - |
| Entrypoint | - |
| CMD | /bin/sh -c export DATA_SOURCE_USER="${POSTGRES_USERNAME?}"; export DATA_SOURCE_PASS="${POSTGRES_P... |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binPGPOOL_SERVICE=localhostPGPOOL_S... |
