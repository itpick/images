# librechat Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | /app |
| Entrypoint | docker-entrypoint.sh |
| CMD | npm run backend |
| Volumes | - |
| Stop signal | - |
| Environment variables | HOST=0.0.0.0LD_PRELOAD=/usr/lib/libjemalloc.so.2NODE_VERSION=20.19.6PATH=/usr/local/sbin:/usr/loc... |
