# etcd

etcd Distributed reliable key-value store for the most critical data of a distributed system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#etcd

# Load into Docker
nix build .#load-etcd-to-docker && ./result/bin/load-etcd-to-docker
```
