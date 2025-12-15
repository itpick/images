# aws-otel-collector-healthcheck

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-otel-collector-healthcheck

# Load into Docker
nix build .#load-aws-otel-collector-healthcheck-to-docker && ./result/bin/load-aws-otel-collector-healthcheck-to-docker
```
