# triton-inference-server-local-cache

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#triton-inference-server-local-cache

# Load into Docker
nix build .#load-triton-inference-server-local-cache-to-docker && ./result/bin/load-triton-inference-server-local-cache-to-docker
```
