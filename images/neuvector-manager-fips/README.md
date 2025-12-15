# neuvector-manager-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#neuvector-manager-fips

# Load into Docker
nix build .#load-neuvector-manager-fips-to-docker && ./result/bin/load-neuvector-manager-fips-to-docker
```
