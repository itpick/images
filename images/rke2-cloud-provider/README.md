# rke2-cloud-provider

rke2-cloud-provider image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rke2-cloud-provider

# Load into Docker
nix build .#load-rke2-cloud-provider-to-docker && ./result/bin/load-rke2-cloud-provider-to-docker
```
