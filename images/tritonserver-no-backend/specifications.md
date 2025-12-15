# tritonserver-no-backend Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | /work |
| Entrypoint | /opt/tritonserver/bin/tritonserver |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | CUDA_VERSION=13.0LD_LIBRARY_PATH=/usr/local/tensorrt/libNVIDIA_DRIVER_CAPABILITIES=compute,utilit... |
