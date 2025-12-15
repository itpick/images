# tritonserver-trtllm-backend Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | /opt/tritonserver |
| Entrypoint | /opt/tritonserver/bin/tritonserver |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | CUDA_VERSION=12.9LD_LIBRARY_PATH=/opt/tensorrt_llm/libs:/usr/local/tensorrt/libNVIDIA_DRIVER_CAPA... |
