# fleet-server-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fleet-server-fips

# Load into Docker
nix build .#load-fleet-server-fips-to-docker && ./result/bin/load-fleet-server-fips-to-docker
```
