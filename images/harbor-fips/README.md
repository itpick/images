# harbor-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#harbor-fips

# Load into Docker
nix build .#load-harbor-fips-to-docker && ./result/bin/load-harbor-fips-to-docker
```
