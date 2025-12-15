# dcgm-fips

NVIDIA Data Center GPU Manager (DCGM) is a project for gathering telemetry and measuring the health of NVIDIA GPUs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dcgm-fips

# Load into Docker
nix build .#load-dcgm-fips-to-docker && ./result/bin/load-dcgm-fips-to-docker
```
