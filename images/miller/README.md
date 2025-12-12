# miller

## Image Size

| Type | Size |
|------|------|
| Compressed | 162.16 MB |
| Uncompressed | ~405.42 MB |

## Usage

```bash
# Build the image
nix build .#miller

# Load into Docker
nix build .#load-miller-to-docker && ./result/bin/load-miller-to-docker
```
