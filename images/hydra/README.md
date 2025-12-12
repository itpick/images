# hydra

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.40 GB |
| Uncompressed | ~3.51 GB |

## Usage

```bash
# Build the image
nix build .#hydra

# Load into Docker
nix build .#load-hydra-to-docker && ./result/bin/load-hydra-to-docker
```
