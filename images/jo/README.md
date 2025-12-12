# jo

## Image Size

| Type | Size |
|------|------|
| Compressed | 90.53 MB |
| Uncompressed | ~226.33 MB |

## Usage

```bash
# Build the image
nix build .#jo

# Load into Docker
nix build .#load-jo-to-docker && ./result/bin/load-jo-to-docker
```
