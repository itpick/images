# mysql-iamguarded Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | - |
| Entrypoint | /opt/iamguarded/scripts/mysql/entrypoint.sh |
| CMD | /opt/iamguarded/scripts/mysql/run.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | MYSQL_HOME=/opt/iamguarded/mysql/confPATH=/opt/iamguarded/mysql/bin:/opt/iamguarded/common/bin:/u... |
