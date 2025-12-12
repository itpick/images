# opentelemetry-collector-contrib

Minimal image with opentelemetry-collector-contrib

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 635.82 MB |
| Uncompressed | ~1.55 GB |

## Usage

```bash
# Build the image
nix build .#opentelemetry-collector-contrib

# Load into Docker
nix build .#load-opentelemetry-collector-contrib-to-docker && ./result/bin/load-opentelemetry-collector-contrib-to-docker
```
