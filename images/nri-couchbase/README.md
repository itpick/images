# nri-couchbase

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-couchbase

# Load into Docker
nix build .#load-nri-couchbase-to-docker && ./result/bin/load-nri-couchbase-to-docker
```
