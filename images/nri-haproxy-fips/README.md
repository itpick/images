# nri-haproxy-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-haproxy-fips

# Load into Docker
nix build .#load-nri-haproxy-fips-to-docker && ./result/bin/load-nri-haproxy-fips-to-docker
```
