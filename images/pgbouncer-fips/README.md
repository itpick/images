# pgbouncer-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pgbouncer-fips

# Load into Docker
nix build .#load-pgbouncer-fips-to-docker && ./result/bin/load-pgbouncer-fips-to-docker
```
