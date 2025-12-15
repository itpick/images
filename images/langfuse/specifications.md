# langfuse Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | /app |
| Entrypoint | dumb-init -- /app/web/entrypoint.sh |
| CMD | node web/server.js |
| Volumes | - |
| Stop signal | - |
| Environment variables | BUILD_ID=DOCKER_BUILD=0NEXT_MANUAL_SIG_HANDLE=trueNEXT_PUBLIC_LANGFUSE_CLOUD_REGION=NEXT_TELEMETR... |
