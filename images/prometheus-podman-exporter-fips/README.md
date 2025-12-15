# prometheus-podman-exporter-fips

Prometheus exporter for podman environments exposing containers, pods, images, volumes and networks information

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-podman-exporter-fips

# Load into Docker
nix build .#load-prometheus-podman-exporter-fips-to-docker && ./result/bin/load-prometheus-podman-exporter-fips-to-docker
```
