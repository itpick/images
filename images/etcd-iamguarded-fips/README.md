# etcd-iamguarded-fips

etcd Distributed reliable key-value store for the most critical data of a distributed system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#etcd-iamguarded-fips

# Load into Docker
nix build .#load-etcd-iamguarded-fips-to-docker && ./result/bin/load-etcd-iamguarded-fips-to-docker
```
