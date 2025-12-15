# enterprise-metrics

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#enterprise-metrics

# Load into Docker
nix build .#load-enterprise-metrics-to-docker && ./result/bin/load-enterprise-metrics-to-docker
```
