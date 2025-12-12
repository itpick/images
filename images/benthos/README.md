# benthos

## Image Size

| Type | Size |
|------|------|
| Compressed | 134.27 MB |
| Uncompressed | ~335.67 MB |

## Usage

```bash
# Build the image
nix build .#benthos

# Load into Docker
nix build .#load-benthos-to-docker && ./result/bin/load-benthos-to-docker
```
