# go-ipfs

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#go-ipfs

# Load into Docker
nix build .#load-go-ipfs-to-docker && ./result/bin/load-go-ipfs-to-docker
```
