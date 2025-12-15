# minio-iamguarded-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | - |
| Entrypoint | /opt/iamguarded/scripts/minio/entrypoint.sh |
| CMD | /opt/iamguarded/scripts/minio/run.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE=/etc/ssl/certs/ca-... |
