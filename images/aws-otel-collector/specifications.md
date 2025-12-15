# aws-otel-collector Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 65532 |
| Working directory | - |
| Entrypoint | /awscollector |
| CMD | --config=/etc/otel-config.yaml |
| Volumes | - |
| Stop signal | - |
| Environment variables | HOME=/home/aocPATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binRUN_IN_CONTAINER=T... |
