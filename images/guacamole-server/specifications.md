# guacamole-server Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | - |
| Entrypoint | - |
| CMD | /bin/sh -c /usr/sbin/guacd  -b 0.0.0.0 -L $GUACD_LOG_LEVEL -f |
| Volumes | - |
| Stop signal | - |
| Environment variables | GUACD_LOG_LEVEL=infoLC_ALL=C.UTF-8LD_LIBRARY_PATH=/usr/libPATH=/usr/local/sbin:/usr/local/bin:/us... |
