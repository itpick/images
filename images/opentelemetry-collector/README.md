# opentelemetry-collector

Minimal image with opentelemetry-collector

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 277.63 MB |
| Uncompressed | ~694.07 MB |

## Usage

```bash
# Build the image
nix build .#opentelemetry-collector

# Load into Docker
nix build .#load-opentelemetry-collector-to-docker && ./result/bin/load-opentelemetry-collector-to-docker
```
