# nri-nagios-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-nagios-fips

# Load into Docker
nix build .#load-nri-nagios-fips-to-docker && ./result/bin/load-nri-nagios-fips-to-docker
```
