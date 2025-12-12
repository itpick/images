# fio

## Image Size

| Type | Size |
|------|------|
| Compressed | 275.14 MB |
| Uncompressed | ~687.86 MB |

## Usage

```bash
# Build the image
nix build .#fio

# Load into Docker
nix build .#load-fio-to-docker && ./result/bin/load-fio-to-docker
```
