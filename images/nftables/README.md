# nftables

## Image Size

| Type | Size |
|------|------|
| Compressed | 117.92 MB |
| Uncompressed | ~294.82 MB |

## Usage

```bash
# Build the image
nix build .#nftables

# Load into Docker
nix build .#load-nftables-to-docker && ./result/bin/load-nftables-to-docker
```
