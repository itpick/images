# grpcurl

## Image Size

| Type | Size |
|------|------|
| Compressed | 141.68 MB |
| Uncompressed | ~354.20 MB |

## Usage

```bash
# Build the image
nix build .#grpcurl

# Load into Docker
nix build .#load-grpcurl-to-docker && ./result/bin/load-grpcurl-to-docker
```
