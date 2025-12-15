# openbao-k8s-fips

Minimal image with OpenBao, FIPS compliant

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openbao-k8s-fips

# Load into Docker
nix build .#load-openbao-k8s-fips-to-docker && ./result/bin/load-openbao-k8s-fips-to-docker
```
