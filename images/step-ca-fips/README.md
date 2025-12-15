# step-ca-fips

Minimal FIPS image of step-ca, an online Certificate Authority (CA) for secure, automated X.509 and SSH certificate management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#step-ca-fips

# Load into Docker
nix build .#load-step-ca-fips-to-docker && ./result/bin/load-step-ca-fips-to-docker
```
