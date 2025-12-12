# metricbeat

## Image Size

| Type | Size |
|------|------|
| Compressed | 301.90 MB |
| Uncompressed | ~754.76 MB |

## Usage

```bash
# Build the image
nix build .#metricbeat

# Load into Docker
nix build .#load-metricbeat-to-docker && ./result/bin/load-metricbeat-to-docker
```
