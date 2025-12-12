# containerd

## Image Size

| Type | Size |
|------|------|
| Compressed | 277.95 MB |
| Uncompressed | ~694.89 MB |

## Usage

```bash
# Build the image
nix build .#containerd

# Load into Docker
nix build .#load-containerd-to-docker && ./result/bin/load-containerd-to-docker
```
