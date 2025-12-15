# openbao-k8s

Minimal image with OpenBao

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openbao-k8s

# Load into Docker
nix build .#load-openbao-k8s-to-docker && ./result/bin/load-openbao-k8s-to-docker
```
