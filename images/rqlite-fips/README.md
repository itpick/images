# rqlite-fips

Minimal image with rqlite, a lightweight, distributed relational database built on SQLite. rqlite uses the Raft consensus protocol to provide strong consistency across a cluster of nodes, making it an ideal solution for lightweight, fault-tolerant distributed databases

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rqlite-fips

# Load into Docker
nix build .#load-rqlite-fips-to-docker && ./result/bin/load-rqlite-fips-to-docker
```
