# langfuse-worker Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | /app |
| Entrypoint | dumb-init -- /app/worker/entrypoint.sh |
| CMD | node worker/dist/index.js |
| Volumes | - |
| Stop signal | - |
| Environment variables | BUILD_ID=DOCKER_BUILD=0NODE_ENV=productionNODE_VERSION=20.19.6PATH=/usr/local/sbin:/usr/local/bin... |
