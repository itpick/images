# ipfs-cluster-fips

Pinset orchestration for IPFS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ipfs-cluster-fips

# Load into Docker
nix build .#load-ipfs-cluster-fips-to-docker && ./result/bin/load-ipfs-cluster-fips-to-docker
```
