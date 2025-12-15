# spicedb-operator

SpiceDB Operator is a Kubernetes operator for managing SpiceDB clusters, providing automated deployment, scaling, and management of SpiceDB instances

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spicedb-operator

# Load into Docker
nix build .#load-spicedb-operator-to-docker && ./result/bin/load-spicedb-operator-to-docker
```
