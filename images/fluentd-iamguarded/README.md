# fluentd-iamguarded

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fluentd-iamguarded

# Load into Docker
nix build .#load-fluentd-iamguarded-to-docker && ./result/bin/load-fluentd-iamguarded-to-docker
```
