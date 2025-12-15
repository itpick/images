# eclipse-mosquitto Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1883 |
| Working directory | - |
| Entrypoint | /docker-entrypoint.sh |
| CMD | /usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf |
| Volumes | /mosquitto/data/mosquitto/log |
| Stop signal | - |
| Environment variables | PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE=/etc/ssl/certs/ca-... |
