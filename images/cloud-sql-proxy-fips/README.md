# cloud-sql-proxy-fips

The Cloud SQL Auth Proxy is a utility for ensuring secure connections to Cloud SQL instances

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cloud-sql-proxy-fips

# Load into Docker
nix build .#load-cloud-sql-proxy-fips-to-docker && ./result/bin/load-cloud-sql-proxy-fips-to-docker
```
