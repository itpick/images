# step-issuer-fips

Minimal FIPS image of step-issuer, a certificate issuer for cert-manager using step-ca as a backend CA

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#step-issuer-fips

# Load into Docker
nix build .#load-step-issuer-fips-to-docker && ./result/bin/load-step-issuer-fips-to-docker
```
