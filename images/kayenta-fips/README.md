# kayenta-fips

FIPS-compliant Automated Canary Service

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kayenta-fips

# Load into Docker
nix build .#load-kayenta-fips-to-docker && ./result/bin/load-kayenta-fips-to-docker
```
