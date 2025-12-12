# pdns-recursor

## Image Size

| Type | Size |
|------|------|
| Compressed | 534.89 MB |
| Uncompressed | ~1.30 GB |

## Usage

```bash
# Build the image
nix build .#pdns-recursor

# Load into Docker
nix build .#load-pdns-recursor-to-docker && ./result/bin/load-pdns-recursor-to-docker
```
