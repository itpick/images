# hubble-ui-backend-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#hubble-ui-backend-fips

# Load into Docker
nix build .#load-hubble-ui-backend-fips-to-docker && ./result/bin/load-hubble-ui-backend-fips-to-docker
```
