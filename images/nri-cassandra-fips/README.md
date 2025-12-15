# nri-cassandra-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-cassandra-fips

# Load into Docker
nix build .#load-nri-cassandra-fips-to-docker && ./result/bin/load-nri-cassandra-fips-to-docker
```
