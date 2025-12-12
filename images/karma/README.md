# karma

## Image Size

| Type | Size |
|------|------|
| Compressed | 138.47 MB |
| Uncompressed | ~346.18 MB |

## Usage

```bash
# Build the image
nix build .#karma

# Load into Docker
nix build .#load-karma-to-docker && ./result/bin/load-karma-to-docker
```
