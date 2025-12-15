# kubernetes-dns-node-cache

Minimal image that acts as a drop-in replacement for the NodeLocal DNSCache image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-dns-node-cache

# Load into Docker
nix build .#load-kubernetes-dns-node-cache-to-docker && ./result/bin/load-kubernetes-dns-node-cache-to-docker
```
