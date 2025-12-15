# postgres-iamguarded-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | - |
| Entrypoint | /opt/iamguarded/scripts/postgresql/entrypoint.sh /opt/iamguarded/scripts/postgresql/run.sh |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | LANG=en_US.UTF-8PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binPGDATA=/opt/iamg... |
