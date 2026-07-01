# fluentd-nixchart

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fluentd-nixchart

# Load into Docker
nix build .#load-fluentd-nixchart-to-docker && ./result/bin/load-fluentd-nixchart-to-docker
```
