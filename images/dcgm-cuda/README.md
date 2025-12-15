# dcgm-cuda

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dcgm-cuda

# Load into Docker
nix build .#load-dcgm-cuda-to-docker && ./result/bin/load-dcgm-cuda-to-docker
```
