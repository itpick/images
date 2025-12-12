# mcfly

## Image Size

| Type | Size |
|------|------|
| Compressed | 110.14 MB |
| Uncompressed | ~275.36 MB |

## Usage

```bash
# Build the image
nix build .#mcfly

# Load into Docker
nix build .#load-mcfly-to-docker && ./result/bin/load-mcfly-to-docker
```
