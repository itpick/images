# db-operator

The DB Operator creates databases and make them available in the cluster via Custom Resource

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#db-operator

# Load into Docker
nix build .#load-db-operator-to-docker && ./result/bin/load-db-operator-to-docker
```
