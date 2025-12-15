# frr-fips

The FRRouting Protocol Suite

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#frr-fips

# Load into Docker
nix build .#load-frr-fips-to-docker && ./result/bin/load-frr-fips-to-docker
```
