# postgres-repmgr-nixchart-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgres-repmgr-nixchart-fips

# Load into Docker
nix build .#load-postgres-repmgr-nixchart-fips-to-docker && ./result/bin/load-postgres-repmgr-nixchart-fips-to-docker
```
