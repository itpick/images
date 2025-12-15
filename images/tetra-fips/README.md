# tetra-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tetra-fips

# Load into Docker
nix build .#load-tetra-fips-to-docker && ./result/bin/load-tetra-fips-to-docker
```
