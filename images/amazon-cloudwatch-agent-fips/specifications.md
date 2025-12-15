# amazon-cloudwatch-agent-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 65532 |
| Working directory | - |
| Entrypoint | /opt/aws/amazon-cloudwatch-agent/bin/start-amazon-cloudwatch-agent |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binRUN_IN_CONTAINER=TrueSSL_CERT_FI... |
