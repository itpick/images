# vgpu-util

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vgpu-util

# Load into Docker
nix build .#load-vgpu-util-to-docker && ./result/bin/load-vgpu-util-to-docker
```
