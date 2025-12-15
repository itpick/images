# authservice-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#authservice-fips

# Load into Docker
nix build .#load-authservice-fips-to-docker && ./result/bin/load-authservice-fips-to-docker
```
