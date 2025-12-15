# ghidra Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | - |
| Entrypoint | /bin/bash |
| CMD | -c /usr/bin/ghidraRun & tail -f /dev/null |
| Volumes | - |
| Stop signal | - |
| Environment variables | DISPLAY=:0GHIDRA_INSTALL_DIR=/usr/share/ghidraJAVA_HOME=/usr/lib/jvm/default-jvmJAVA_HOME_OVERRID... |
