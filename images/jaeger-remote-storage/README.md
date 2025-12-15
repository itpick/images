# jaeger-remote-storage

CNCF Jaeger, a Distributed Tracing Platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-remote-storage

# Load into Docker
nix build .#load-jaeger-remote-storage-to-docker && ./result/bin/load-jaeger-remote-storage-to-docker
```
