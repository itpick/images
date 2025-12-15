# cloudbeat-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cloudbeat-fips

# Load into Docker
nix build .#load-cloudbeat-fips-to-docker && ./result/bin/load-cloudbeat-fips-to-docker
```
