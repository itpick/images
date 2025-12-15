# percona-server-mongodb-operator-fips

Minimal FIPS compliant Kubernetes Operator image which deploys and manages Percona Server for MongoDB on Kubernetes clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#percona-server-mongodb-operator-fips

# Load into Docker
nix build .#load-percona-server-mongodb-operator-fips-to-docker && ./result/bin/load-percona-server-mongodb-operator-fips-to-docker
```
