# nri-couchbase-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-couchbase-fips

# Load into Docker
nix build .#load-nri-couchbase-fips-to-docker && ./result/bin/load-nri-couchbase-fips-to-docker
```
