# pgpool2-nixchart-fips

open-source middleware that operates between PostgreSQL servers and clients, providing features such as connection pooling, load balancing, and replication to enhance database performance and availability

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pgpool2-nixchart-fips

# Load into Docker
nix build .#load-pgpool2-nixchart-fips-to-docker && ./result/bin/load-pgpool2-nixchart-fips-to-docker
```
