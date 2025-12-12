# fzf

## Image Size

| Type | Size |
|------|------|
| Compressed | 112.42 MB |
| Uncompressed | ~281.05 MB |

## Usage

```bash
# Build the image
nix build .#fzf

# Load into Docker
nix build .#load-fzf-to-docker && ./result/bin/load-fzf-to-docker
```
