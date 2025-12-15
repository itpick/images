# spicedb-operator-fips

This is the FIPS-compliant variant of the SpiceDB Operator, a Kubernetes operator for managing SpiceDB clusters, providing automated deployment, scaling, and management of SpiceDB instances

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spicedb-operator-fips

# Load into Docker
nix build .#load-spicedb-operator-fips-to-docker && ./result/bin/load-spicedb-operator-fips-to-docker
```
