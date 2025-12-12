# gdb

## Image Size

| Type | Size |
|------|------|
| Compressed | 409.59 MB |
| Uncompressed | ~1023.99 MB |

## Usage

```bash
# Build the image
nix build .#gdb

# Load into Docker
nix build .#load-gdb-to-docker && ./result/bin/load-gdb-to-docker
```
