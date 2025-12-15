# kube-arangodb-fips

FIPS-compliant ArangoDB Kubernetes Operator for managing ArangoDB database deployments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-arangodb-fips

# Load into Docker
nix build .#load-kube-arangodb-fips-to-docker && ./result/bin/load-kube-arangodb-fips-to-docker
```
