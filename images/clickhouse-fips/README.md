# clickhouse-fips

Clickhouse is the fastest and most resource efficient open-source database for real-time apps and analytics, built with FIPS 140-3 compliant cryptographic modules

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#clickhouse-fips

# Load into Docker
nix build .#load-clickhouse-fips-to-docker && ./result/bin/load-clickhouse-fips-to-docker
```
