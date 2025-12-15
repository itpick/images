# thanos-operator

Minimal image with the thanos-operator for managing Thanos components in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#thanos-operator

# Load into Docker
nix build .#load-thanos-operator-to-docker && ./result/bin/load-thanos-operator-to-docker
```
