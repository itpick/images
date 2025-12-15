# mongodb-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mongodb-fips

# Load into Docker
nix build .#load-mongodb-fips-to-docker && ./result/bin/load-mongodb-fips-to-docker
```
