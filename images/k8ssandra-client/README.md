# k8ssandra-client

A kubectl plugin to simplify usage of k8ssandra

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k8ssandra-client

# Load into Docker
nix build .#load-k8ssandra-client-to-docker && ./result/bin/load-k8ssandra-client-to-docker
```
