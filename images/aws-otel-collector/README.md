# aws-otel-collector

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-otel-collector

# Load into Docker
nix build .#load-aws-otel-collector-to-docker && ./result/bin/load-aws-otel-collector-to-docker
```
