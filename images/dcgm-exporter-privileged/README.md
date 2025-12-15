# dcgm-exporter-privileged

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dcgm-exporter-privileged

# Load into Docker
nix build .#load-dcgm-exporter-privileged-to-docker && ./result/bin/load-dcgm-exporter-privileged-to-docker
```
