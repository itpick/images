# kubo

Minimalist Wolfi-based container image for the IPFS Kubo (go-ipfs) node

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubo

# Load into Docker
nix build .#load-kubo-to-docker && ./result/bin/load-kubo-to-docker
```
