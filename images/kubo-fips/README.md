# kubo-fips

FIPS-compliant, minimalist Wolfi-based container image for the IPFS Kubo (go-ipfs) node

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubo-fips

# Load into Docker
nix build .#load-kubo-fips-to-docker && ./result/bin/load-kubo-fips-to-docker
```
