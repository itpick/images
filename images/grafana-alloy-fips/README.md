# grafana-alloy-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#grafana-alloy-fips

# Load into Docker
nix build .#load-grafana-alloy-fips-to-docker && ./result/bin/load-grafana-alloy-fips-to-docker
```
