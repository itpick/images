# redis-operator

Redis Operator is a Kubernetes operator image that automates Redis cluster deployment, scaling, and management in Kubernetes environments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#redis-operator

# Load into Docker
nix build .#load-redis-operator-to-docker && ./result/bin/load-redis-operator-to-docker
```
