# mariadb-operator-fips

MariaDB operator FIPS image is a FIPS-compliant image of the MariaDB operator, It automates the deployment, scaling, and management of MariaDB instances in Kubernetes clusters, providing declarative configuration and lifecycle management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mariadb-operator-fips

# Load into Docker
nix build .#load-mariadb-operator-fips-to-docker && ./result/bin/load-mariadb-operator-fips-to-docker
```
