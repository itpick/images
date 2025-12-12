# lazydocker

## Image Size

| Type | Size |
|------|------|
| Compressed | 116.87 MB |
| Uncompressed | ~292.18 MB |

## Usage

```bash
# Build the image
nix build .#lazydocker

# Load into Docker
nix build .#load-lazydocker-to-docker && ./result/bin/load-lazydocker-to-docker
```
