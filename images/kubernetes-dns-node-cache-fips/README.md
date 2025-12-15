# kubernetes-dns-node-cache-fips

Minimal image that acts as a drop-in replacement for the NodeLocal DNSCache image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-dns-node-cache-fips

# Load into Docker
nix build .#load-kubernetes-dns-node-cache-fips-to-docker && ./result/bin/load-kubernetes-dns-node-cache-fips-to-docker
```
