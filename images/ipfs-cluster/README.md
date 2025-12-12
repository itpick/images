# ipfs-cluster

## Image Size

| Type | Size |
|------|------|
| Compressed | 433.19 MB |
| Uncompressed | ~1.05 GB |

## Usage

```bash
# Build the image
nix build .#ipfs-cluster

# Load into Docker
nix build .#load-ipfs-cluster-to-docker && ./result/bin/load-ipfs-cluster-to-docker
```
