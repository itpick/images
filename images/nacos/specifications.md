# nacos Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | /home/nacos |
| Entrypoint | sh bin/docker-startup.sh |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | BASE_DIR=/home/nacosCLASSPATH=.:/home/nacos/conf:CLUSTER_CONF=/home/nacos/conf/cluster.confFUNCTI... |
