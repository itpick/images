# nemo

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.79 GB |
| Uncompressed | ~4.49 GB |

## Usage

```bash
# Build the image
nix build .#nemo

# Load into Docker
nix build .#load-nemo-to-docker && ./result/bin/load-nemo-to-docker
```
