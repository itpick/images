# cass-operator

cass-operator, is a Kubernetes operator for managing Apache Cassandra. It automates tasks like deployment, scaling, and configuration management, facilitating the integration of Cassandra clusters with Kubernetes environments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cass-operator

# Load into Docker
nix build .#load-cass-operator-to-docker && ./result/bin/load-cass-operator-to-docker
```
