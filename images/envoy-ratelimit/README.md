# envoy-ratelimit

Go/gRPC service designed to enable generic rate limit scenarios from different types of applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#envoy-ratelimit

# Load into Docker
nix build .#load-envoy-ratelimit-to-docker && ./result/bin/load-envoy-ratelimit-to-docker
```
