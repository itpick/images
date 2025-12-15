# gdal-py3.13

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gdal-py3.13

# Load into Docker
nix build .#load-gdal-py3.13-to-docker && ./result/bin/load-gdal-py3.13-to-docker
```
