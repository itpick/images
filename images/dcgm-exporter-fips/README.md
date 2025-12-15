# dcgm-exporter-fips

NVIDIA GPU metrics exporter for Prometheus leveraging DCGM

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dcgm-exporter-fips

# Load into Docker
nix build .#load-dcgm-exporter-fips-to-docker && ./result/bin/load-dcgm-exporter-fips-to-docker
```
