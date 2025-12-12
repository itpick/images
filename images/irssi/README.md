# irssi

## Image Size

| Type | Size |
|------|------|
| Compressed | 205.55 MB |
| Uncompressed | ~513.88 MB |

## Usage

```bash
# Build the image
nix build .#irssi

# Load into Docker
nix build .#load-irssi-to-docker && ./result/bin/load-irssi-to-docker
```
