# node-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#node-fips

# Load into Docker
nix build .#load-node-fips-to-docker && ./result/bin/load-node-fips-to-docker
```
