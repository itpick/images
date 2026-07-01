# thanos-nixchart

Highly available Prometheus setup with long term storage

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#thanos-nixchart

# Load into Docker
nix build .#load-thanos-nixchart-to-docker && ./result/bin/load-thanos-nixchart-to-docker
```
