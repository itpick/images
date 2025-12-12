# victoria-metrics

## Image Size

| Type | Size |
|------|------|
| Compressed | 390.20 MB |
| Uncompressed | ~975.52 MB |

## Usage

```bash
# Build the image
nix build .#victoria-metrics

# Load into Docker
nix build .#load-victoria-metrics-to-docker && ./result/bin/load-victoria-metrics-to-docker
```
