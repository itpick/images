# lazygit

## Image Size

| Type | Size |
|------|------|
| Compressed | 137.78 MB |
| Uncompressed | ~344.45 MB |

## Usage

```bash
# Build the image
nix build .#lazygit

# Load into Docker
nix build .#load-lazygit-to-docker && ./result/bin/load-lazygit-to-docker
```
