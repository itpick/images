# mariadb-operator

Mariadb-operator is a Kubernetes operator for managing MariaDB databases. It automates the deployment, scaling, and management of MariaDB instances in Kubernetes clusters, providing declarative configuration and lifecycle management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mariadb-operator

# Load into Docker
nix build .#load-mariadb-operator-to-docker && ./result/bin/load-mariadb-operator-to-docker
```
