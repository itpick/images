# nsc-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nsc-fips

# Load into Docker
nix build .#load-nsc-fips-to-docker && ./result/bin/load-nsc-fips-to-docker
```
