# cassandra-fips

Cassandra is a free and open-source, distributed, wide-column store, NoSQL database

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cassandra-fips

# Load into Docker
nix build .#load-cassandra-fips-to-docker && ./result/bin/load-cassandra-fips-to-docker
```
