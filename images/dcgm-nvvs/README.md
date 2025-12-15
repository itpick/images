# dcgm-nvvs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dcgm-nvvs

# Load into Docker
nix build .#load-dcgm-nvvs-to-docker && ./result/bin/load-dcgm-nvvs-to-docker
```
