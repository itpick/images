# fd

## Image Size

| Type | Size |
|------|------|
| Compressed | 115.08 MB |
| Uncompressed | ~287.70 MB |

## Usage

```bash
# Build the image
nix build .#fd

# Load into Docker
nix build .#load-fd-to-docker && ./result/bin/load-fd-to-docker
```
