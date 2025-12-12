# atuin

## Image Size

| Type | Size |
|------|------|
| Compressed | 171.85 MB |
| Uncompressed | ~429.64 MB |

## Usage

```bash
# Build the image
nix build .#atuin

# Load into Docker
nix build .#load-atuin-to-docker && ./result/bin/load-atuin-to-docker
```
