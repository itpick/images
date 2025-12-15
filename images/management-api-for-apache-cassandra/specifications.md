# management-api-for-apache-cassandra Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 999 |
| Working directory | / |
| Entrypoint | /sbin/tini -g -- /docker-entrypoint.sh |
| CMD | mgmtapi |
| Volumes | - |
| Stop signal | - |
| Environment variables | CASSANDRA_CONF=/opt/cassandra/confCASSANDRA_HOME=/opt/cassandraCASSANDRA_LOGS_DIR=/opt/cassandra/... |
