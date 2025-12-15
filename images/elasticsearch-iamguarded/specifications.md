# elasticsearch-iamguarded Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | /opt/iamguarded/elasticsearch |
| Entrypoint | /opt/iamguarded/scripts/elasticsearch/entrypoint.sh |
| CMD | /opt/iamguarded/scripts/elasticsearch/run.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | APP_VERSION=9.2ES_JAVA_HOME=/usr/lib/jvm/java-25-openjdkIAMGUARDED_APP_NAME=elasticsearchJAVA_HOM... |
