# k8s-metadata-injection-fips

Kubernetes metadata injection for New Relic APM to make a linkage between APM and Infrastructure data. This is the FIPS-compliant variant of the image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k8s-metadata-injection-fips

# Load into Docker
nix build .#load-k8s-metadata-injection-fips-to-docker && ./result/bin/load-k8s-metadata-injection-fips-to-docker
```
