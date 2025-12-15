# headlamp

Headlamp is an easy-to-use and extensible Kubernetes web UI designed for developers and cluster operators

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#headlamp

# Load into Docker
nix build .#load-headlamp-to-docker && ./result/bin/load-headlamp-to-docker
```
