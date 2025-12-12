# neovim

## Image Size

| Type | Size |
|------|------|
| Compressed | 464.26 MB |
| Uncompressed | ~1.13 GB |

## Usage

```bash
# Build the image
nix build .#neovim

# Load into Docker
nix build .#load-neovim-to-docker && ./result/bin/load-neovim-to-docker
```
