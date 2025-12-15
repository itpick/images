# postgres-fips

Advanced object-relational database management system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgres-fips

# Load into Docker
nix build .#load-postgres-fips-to-docker && ./result/bin/load-postgres-fips-to-docker
```
