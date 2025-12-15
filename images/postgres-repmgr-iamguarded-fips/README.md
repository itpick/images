# postgres-repmgr-iamguarded-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgres-repmgr-iamguarded-fips

# Load into Docker
nix build .#load-postgres-repmgr-iamguarded-fips-to-docker && ./result/bin/load-postgres-repmgr-iamguarded-fips-to-docker
```
