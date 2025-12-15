# gatekeeper-fips

Minimal FIPS-compliant Gatekeeper image for enforcing Kubernetes policies using Open Policy Agent

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gatekeeper-fips

# Load into Docker
nix build .#load-gatekeeper-fips-to-docker && ./result/bin/load-gatekeeper-fips-to-docker
```
