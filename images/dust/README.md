# dust

## Image Size

| Type | Size |
|------|------|
| Compressed | 106.37 MB |
| Uncompressed | ~265.93 MB |

## Usage

```bash
# Build the image
nix build .#dust

# Load into Docker
nix build .#load-dust-to-docker && ./result/bin/load-dust-to-docker
```
