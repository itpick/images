# rke2

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rke2

# Load into Docker
nix build .#load-rke2-to-docker && ./result/bin/load-rke2-to-docker
```
