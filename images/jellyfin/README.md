# jellyfin

## Image Size

| Type | Size |
|------|------|
| Compressed | 2.83 GB |
| Uncompressed | ~7.08 GB |

## Usage

```bash
# Build the image
nix build .#jellyfin

# Load into Docker
nix build .#load-jellyfin-to-docker && ./result/bin/load-jellyfin-to-docker
```
