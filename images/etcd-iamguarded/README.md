# etcd-iamguarded

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#etcd-iamguarded

# Load into Docker
nix build .#load-etcd-iamguarded-to-docker && ./result/bin/load-etcd-iamguarded-to-docker
```
