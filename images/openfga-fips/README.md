# openfga-fips

OpenFGA is a high-performance and flexible authorization and permission engine built for developers and inspired by Google Zanzibar

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openfga-fips

# Load into Docker
nix build .#load-openfga-fips-to-docker && ./result/bin/load-openfga-fips-to-docker
```
