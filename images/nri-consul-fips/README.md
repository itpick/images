# nri-consul-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-consul-fips

# Load into Docker
nix build .#load-nri-consul-fips-to-docker && ./result/bin/load-nri-consul-fips-to-docker
```
