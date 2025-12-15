# dcgm-exporter

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dcgm-exporter

# Load into Docker
nix build .#load-dcgm-exporter-to-docker && ./result/bin/load-dcgm-exporter-to-docker
```
