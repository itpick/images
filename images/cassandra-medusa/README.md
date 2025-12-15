# cassandra-medusa

cassandra-medusa, is a Apache Cassandra Backup and Restore Tool

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cassandra-medusa

# Load into Docker
nix build .#load-cassandra-medusa-to-docker && ./result/bin/load-cassandra-medusa-to-docker
```
