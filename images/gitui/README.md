# gitui

## Image Size

| Type | Size |
|------|------|
| Compressed | 128.01 MB |
| Uncompressed | ~320.03 MB |

## Usage

```bash
# Build the image
nix build .#gitui

# Load into Docker
nix build .#load-gitui-to-docker && ./result/bin/load-gitui-to-docker
```
