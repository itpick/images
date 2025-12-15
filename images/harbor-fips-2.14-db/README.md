# harbor-fips-2.14-db

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#harbor-fips-2.14-db

# Load into Docker
nix build .#load-harbor-fips-2.14-db-to-docker && ./result/bin/load-harbor-fips-2.14-db-to-docker
```
