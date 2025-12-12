# influxdb

## Image Size

| Type | Size |
|------|------|
| Compressed | 435.80 MB |
| Uncompressed | ~1.06 GB |

## Usage

```bash
# Build the image
nix build .#influxdb

# Load into Docker
nix build .#load-influxdb-to-docker && ./result/bin/load-influxdb-to-docker
```
