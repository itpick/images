# ipfs-cluster

Pinset orchestration for IPFS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ipfs-cluster

# Load into Docker
nix build .#load-ipfs-cluster-to-docker && ./result/bin/load-ipfs-cluster-to-docker
```
