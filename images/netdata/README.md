# netdata

## Image Size

| Type | Size |
|------|------|
| Compressed | 903.15 MB |
| Uncompressed | ~2.20 GB |

## Usage

```bash
# Build the image
nix build .#netdata

# Load into Docker
nix build .#load-netdata-to-docker && ./result/bin/load-netdata-to-docker
```
