# netcat-openbsd

## Image Size

| Type | Size |
|------|------|
| Compressed | 90.84 MB |
| Uncompressed | ~227.10 MB |

## Usage

```bash
# Build the image
nix build .#netcat-openbsd

# Load into Docker
nix build .#load-netcat-openbsd-to-docker && ./result/bin/load-netcat-openbsd-to-docker
```
