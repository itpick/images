# temporal-cassandra-tool

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#temporal-cassandra-tool

# Load into Docker
nix build .#load-temporal-cassandra-tool-to-docker && ./result/bin/load-temporal-cassandra-tool-to-docker
```
