# exim

## Image Size

| Type | Size |
|------|------|
| Compressed | 206.76 MB |
| Uncompressed | ~516.91 MB |

## Usage

```bash
# Build the image
nix build .#exim

# Load into Docker
nix build .#load-exim-to-docker && ./result/bin/load-exim-to-docker
```
