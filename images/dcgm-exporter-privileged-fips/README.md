# dcgm-exporter-privileged-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dcgm-exporter-privileged-fips

# Load into Docker
nix build .#load-dcgm-exporter-privileged-fips-to-docker && ./result/bin/load-dcgm-exporter-privileged-fips-to-docker
```
