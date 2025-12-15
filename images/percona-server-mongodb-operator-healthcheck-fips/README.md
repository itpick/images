# percona-server-mongodb-operator-healthcheck-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#percona-server-mongodb-operator-healthcheck-fips

# Load into Docker
nix build .#load-percona-server-mongodb-operator-healthcheck-fips-to-docker && ./result/bin/load-percona-server-mongodb-operator-healthcheck-fips-to-docker
```
