# sqlpad Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | /usr/app/sqlpad-server |
| Entrypoint | node server.js --config ./config.dev.env |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | NODE_ENV=productionPATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSQLPAD_DB_PAT... |
