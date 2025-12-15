# cassandra-reaper

Automated Repair Awesomeness for Apache Cassandra

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cassandra-reaper

# Load into Docker
nix build .#load-cassandra-reaper-to-docker && ./result/bin/load-cassandra-reaper-to-docker
```
