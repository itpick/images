# cassandra-medusa-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cassandra-medusa-fips

# Load into Docker
nix build .#load-cassandra-medusa-fips-to-docker && ./result/bin/load-cassandra-medusa-fips-to-docker
```
