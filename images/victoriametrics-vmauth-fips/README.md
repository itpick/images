# victoriametrics-vmauth-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#victoriametrics-vmauth-fips

# Load into Docker
nix build .#load-victoriametrics-vmauth-fips-to-docker && ./result/bin/load-victoriametrics-vmauth-fips-to-docker
```
