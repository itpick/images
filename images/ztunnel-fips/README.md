# ztunnel-fips

The ztunnel component of ambient mesh

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ztunnel-fips

# Load into Docker
nix build .#load-ztunnel-fips-to-docker && ./result/bin/load-ztunnel-fips-to-docker
```
