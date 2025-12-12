# delta

## Image Size

| Type | Size |
|------|------|
| Compressed | 115.74 MB |
| Uncompressed | ~289.36 MB |

## Usage

```bash
# Build the image
nix build .#delta

# Load into Docker
nix build .#load-delta-to-docker && ./result/bin/load-delta-to-docker
```
