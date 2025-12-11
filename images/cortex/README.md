# cortex

Cortex provides horizontally scalable, highly available, multi-tenant, long term storage for Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#cortex

# Load into Docker
nix build .#load-cortex-to-docker && ./result/bin/load-cortex-to-docker
```
