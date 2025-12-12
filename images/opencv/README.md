# opencv

## Image Size

| Type | Size |
|------|------|
| Compressed | 738.26 MB |
| Uncompressed | ~1.80 GB |

## Usage

```bash
# Build the image
nix build .#opencv

# Load into Docker
nix build .#load-opencv-to-docker && ./result/bin/load-opencv-to-docker
```
