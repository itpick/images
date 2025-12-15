# nri-jmx-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-jmx-fips

# Load into Docker
nix build .#load-nri-jmx-fips-to-docker && ./result/bin/load-nri-jmx-fips-to-docker
```
