# nova-fips

FIPS-compliant version of Nova. Scans your Kubernetes cluster for outdated Helm charts, then suggests updates

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nova-fips

# Load into Docker
nix build .#load-nova-fips-to-docker && ./result/bin/load-nova-fips-to-docker
```
