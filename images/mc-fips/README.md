# mc-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mc-fips

# Load into Docker
nix build .#load-mc-fips-to-docker && ./result/bin/load-mc-fips-to-docker
```
