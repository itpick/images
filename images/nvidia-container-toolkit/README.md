# nvidia-container-toolkit

## Image Size

| Type | Size |
|------|------|
| Compressed | 119.75 MB |
| Uncompressed | ~299.39 MB |

## Usage

```bash
# Build the image
nix build .#nvidia-container-toolkit

# Load into Docker
nix build .#load-nvidia-container-toolkit-to-docker && ./result/bin/load-nvidia-container-toolkit-to-docker
```
