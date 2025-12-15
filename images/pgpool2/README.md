# pgpool2

Middleware that works between PostgreSQL servers and a PostgreSQL database client

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pgpool2

# Load into Docker
nix build .#load-pgpool2-to-docker && ./result/bin/load-pgpool2-to-docker
```
