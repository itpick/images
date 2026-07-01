# postgres-repmgr-nixchart-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | - |
| Entrypoint | /opt/iamguarded/scripts/postgresql-repmgr/entrypoint.sh |
| CMD | /opt/iamguarded/scripts/postgresql-repmgr/run.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | LANG=en_US.UTF-8LANGUAGE=en_US:enNSS_WRAPPER_LIB=/opt/iamguarded/common/lib/libnss_wrapper.soPATH... |
