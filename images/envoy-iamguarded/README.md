# envoy-iamguarded

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#envoy-iamguarded

# Load into Docker
nix build .#load-envoy-iamguarded-to-docker && ./result/bin/load-envoy-iamguarded-to-docker
```
