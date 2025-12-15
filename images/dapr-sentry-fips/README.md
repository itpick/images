# dapr-sentry-fips

Dapr is a portable, event-driven, runtime for building distributed applications across cloud and edge

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dapr-sentry-fips

# Load into Docker
nix build .#load-dapr-sentry-fips-to-docker && ./result/bin/load-dapr-sentry-fips-to-docker
```
