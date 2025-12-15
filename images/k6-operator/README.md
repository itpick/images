# k6-operator

Kubernetes operator for running distributed k6 performance tests

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k6-operator

# Load into Docker
nix build .#load-k6-operator-to-docker && ./result/bin/load-k6-operator-to-docker
```
