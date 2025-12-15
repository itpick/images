# cassandra

Cassandra is a free and open-source, distributed, wide-column store, NoSQL database

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 9s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cassandra

# Load into Docker
nix build .#load-cassandra-to-docker && ./result/bin/load-cassandra-to-docker
```
