# dcgm Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 0 |
| Working directory | - |
| Entrypoint | /usr/bin/nv-hostengine |
| CMD | -n -b 0.0.0.0 --log-level NONE -f - |
| Volumes | - |
| Stop signal | - |
| Environment variables | CUDA_VERSION=12.8DEBIAN_FRONTEND=noninteractiveLD_LIBRARY_PATH=/usr/local/cuda/lib64NO_SETCAP=NVA... |
