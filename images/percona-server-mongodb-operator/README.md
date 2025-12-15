# percona-server-mongodb-operator

Minimal Kubernetes Operator image which deploys and manages Percona Server for MongoDB on Kubernetes clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#percona-server-mongodb-operator

# Load into Docker
nix build .#load-percona-server-mongodb-operator-to-docker && ./result/bin/load-percona-server-mongodb-operator-to-docker
```
