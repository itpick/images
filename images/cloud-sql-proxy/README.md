# cloud-sql-proxy

The Cloud SQL Auth Proxy is a utility for ensuring secure connections to Cloud SQL instances

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cloud-sql-proxy

# Load into Docker
nix build .#load-cloud-sql-proxy-to-docker && ./result/bin/load-cloud-sql-proxy-to-docker
```
