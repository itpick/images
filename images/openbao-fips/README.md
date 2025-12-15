# openbao-fips

Minimal image with OpenBao, FIPS compliant

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openbao-fips

# Load into Docker
nix build .#load-openbao-fips-to-docker && ./result/bin/load-openbao-fips-to-docker
```
