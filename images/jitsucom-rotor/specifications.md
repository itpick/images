# jitsucom-rotor Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | /app |
| Entrypoint | /usr/local/bin/docker-entrypoint.sh |
| CMD | --no-node-snapshot --max-old-space-size=2048 main.js |
| Volumes | - |
| Stop signal | - |
| Environment variables | NODE_ENV=productionPATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE... |
