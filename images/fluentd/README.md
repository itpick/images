# fluentd

Fluentd: Unified Logging Layer (project under CNCF)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 7s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#fluentd

# Load into Docker
nix build .#load-fluentd-to-docker && ./result/bin/load-fluentd-to-docker
```
