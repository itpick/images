# debezium-connect Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | /kafka |
| Entrypoint | /docker-entrypoint.sh |
| CMD | start |
| Volumes | - |
| Stop signal | - |
| Environment variables | CONNECT_PLUGIN_PATH=DEBEZIUM_VERSION=3.0EXTERNAL_LIBS_DIR=/kafka/external_libsKAFKA_CONNECT_PLUGI... |
