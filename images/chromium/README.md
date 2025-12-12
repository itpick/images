# chromium

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.76 GB |
| Uncompressed | ~4.41 GB |

## Usage

```bash
# Build the image
nix build .#chromium

# Load into Docker
nix build .#load-chromium-to-docker && ./result/bin/load-chromium-to-docker
```
