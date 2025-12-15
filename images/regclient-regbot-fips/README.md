# regclient-regbot-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#regclient-regbot-fips

# Load into Docker
nix build .#load-regclient-regbot-fips-to-docker && ./result/bin/load-regclient-regbot-fips-to-docker
```
