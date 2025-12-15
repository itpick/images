# hubble-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#hubble-fips

# Load into Docker
nix build .#load-hubble-fips-to-docker && ./result/bin/load-hubble-fips-to-docker
```
