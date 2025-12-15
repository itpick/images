# redisinsight Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1000 |
| Working directory | /usr/src/app |
| Entrypoint | ./docker-entry.sh node redisinsight/api/dist/src/main |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | NODE_ENV=productionPATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binRI_APP_FOLDER... |
