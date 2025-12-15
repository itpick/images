# k8s-dns-node-cache

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#k8s-dns-node-cache

# Load into Docker
nix build .#load-k8s-dns-node-cache-to-docker && ./result/bin/load-k8s-dns-node-cache-to-docker
```
