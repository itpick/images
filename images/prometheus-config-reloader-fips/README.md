# prometheus-config-reloader-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-config-reloader-fips

# Load into Docker
nix build .#load-prometheus-config-reloader-fips-to-docker && ./result/bin/load-prometheus-config-reloader-fips-to-docker
```
