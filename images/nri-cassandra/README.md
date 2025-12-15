# nri-cassandra

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-cassandra

# Load into Docker
nix build .#load-nri-cassandra-to-docker && ./result/bin/load-nri-cassandra-to-docker
```
