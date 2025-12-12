# just

## Image Size

| Type | Size |
|------|------|
| Compressed | 108.10 MB |
| Uncompressed | ~270.26 MB |

## Usage

```bash
# Build the image
nix build .#just

# Load into Docker
nix build .#load-just-to-docker && ./result/bin/load-just-to-docker
```
