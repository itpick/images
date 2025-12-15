# thanos-iamguarded-client

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#thanos-iamguarded-client

# Load into Docker
nix build .#load-thanos-iamguarded-client-to-docker && ./result/bin/load-thanos-iamguarded-client-to-docker
```
