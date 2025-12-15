# rabbitmq-iamguarded Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | /opt/iamguarded/rabbitmq |
| Entrypoint | /opt/iamguarded/scripts/rabbitmq/entrypoint.sh /opt/iamguarded/scripts/rabbitmq/run.sh |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | HOME=/opt/iamguarded/rabbitmq/.rabbitmqLANG=en_US.UTF-8PATH=/opt/iamguarded/erlang/bin:/opt/iamgu... |
