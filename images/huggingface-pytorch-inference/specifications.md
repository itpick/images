# huggingface-pytorch-inference Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 0 |
| Working directory | / |
| Entrypoint | python /usr/local/bin/dockerd-entrypoint.py |
| CMD | serve |
| Volumes | - |
| Stop signal | - |
| Environment variables | CUDA_VERSION=12.9DEBIAN_FRONTEND=noninteractiveDLC_CONTAINER_TYPE=inferenceHF_HUB_ENABLE_HF_TRANS... |
