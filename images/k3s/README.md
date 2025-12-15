# k3s

Minimal image of K3s, a lightweight Kubernetes distribution

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#k3s

# Load into Docker
nix build .#load-k3s-to-docker && ./result/bin/load-k3s-to-docker
```
