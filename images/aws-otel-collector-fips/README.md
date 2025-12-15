# aws-otel-collector-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-otel-collector-fips

# Load into Docker
nix build .#load-aws-otel-collector-fips-to-docker && ./result/bin/load-aws-otel-collector-fips-to-docker
```
