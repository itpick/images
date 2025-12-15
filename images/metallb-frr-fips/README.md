# metallb-frr-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#metallb-frr-fips

# Load into Docker
nix build .#load-metallb-frr-fips-to-docker && ./result/bin/load-metallb-frr-fips-to-docker
```
