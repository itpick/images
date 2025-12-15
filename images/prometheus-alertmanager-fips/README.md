# prometheus-alertmanager-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-alertmanager-fips

# Load into Docker
nix build .#load-prometheus-alertmanager-fips-to-docker && ./result/bin/load-prometheus-alertmanager-fips-to-docker
```
