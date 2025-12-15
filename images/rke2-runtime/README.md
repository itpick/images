# rke2-runtime

Minimal image of RKE2's container runtime

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rke2-runtime

# Load into Docker
nix build .#load-rke2-runtime-to-docker && ./result/bin/load-rke2-runtime-to-docker
```
