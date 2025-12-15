# k8s-sidecar

Minimal image with the k8s-sidecar app

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#k8s-sidecar

# Load into Docker
nix build .#load-k8s-sidecar-to-docker && ./result/bin/load-k8s-sidecar-to-docker
```
