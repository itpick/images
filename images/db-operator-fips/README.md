# db-operator-fips

The DB Operator creates databases and make them available in the cluster via Custom Resource

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#db-operator-fips

# Load into Docker
nix build .#load-db-operator-fips-to-docker && ./result/bin/load-db-operator-fips-to-docker
```
