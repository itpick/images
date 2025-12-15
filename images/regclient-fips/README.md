# regclient-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#regclient-fips

# Load into Docker
nix build .#load-regclient-fips-to-docker && ./result/bin/load-regclient-fips-to-docker
```
