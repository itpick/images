# chart-testing

## Image Size

| Type | Size |
|------|------|
| Compressed | 1013.66 MB |
| Uncompressed | ~2.47 GB |

## Usage

```bash
# Build the image
nix build .#chart-testing

# Load into Docker
nix build .#load-chart-testing-to-docker && ./result/bin/load-chart-testing-to-docker
```
