# step-issuer

Minimal container image of step-issuer, a certificate issuer for cert-manager using step certificates CA

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#step-issuer

# Load into Docker
nix build .#load-step-issuer-to-docker && ./result/bin/load-step-issuer-to-docker
```
