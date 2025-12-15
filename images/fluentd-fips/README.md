# fluentd-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fluentd-fips

# Load into Docker
nix build .#load-fluentd-fips-to-docker && ./result/bin/load-fluentd-fips-to-docker
```
