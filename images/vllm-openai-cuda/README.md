# vllm-openai-cuda

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vllm-openai-cuda

# Load into Docker
nix build .#load-vllm-openai-cuda-to-docker && ./result/bin/load-vllm-openai-cuda-to-docker
```
