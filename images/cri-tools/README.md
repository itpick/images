# cri-tools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cri-tools

# Load into Docker
nix build .#load-cri-tools-to-docker && ./result/bin/load-cri-tools-to-docker
```
