# minio-warp

## Image Size

| Type | Size |
|------|------|
| Compressed | 134.31 MB |
| Uncompressed | ~335.79 MB |

## Usage

```bash
# Build the image
nix build .#minio-warp

# Load into Docker
nix build .#load-minio-warp-to-docker && ./result/bin/load-minio-warp-to-docker
```
