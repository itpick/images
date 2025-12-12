# nushell

## Image Size

| Type | Size |
|------|------|
| Compressed | 190.67 MB |
| Uncompressed | ~476.67 MB |

## Usage

```bash
# Build the image
nix build .#nushell

# Load into Docker
nix build .#load-nushell-to-docker && ./result/bin/load-nushell-to-docker
```
