# node-local-dns

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 9s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#node-local-dns

# Load into Docker
nix build .#load-node-local-dns-to-docker && ./result/bin/load-node-local-dns-to-docker
```
