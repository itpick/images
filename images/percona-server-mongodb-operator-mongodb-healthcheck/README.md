# percona-server-mongodb-operator-mongodb-healthcheck

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#percona-server-mongodb-operator-mongodb-healthcheck

# Load into Docker
nix build .#load-percona-server-mongodb-operator-mongodb-healthcheck-to-docker && ./result/bin/load-percona-server-mongodb-operator-mongodb-healthcheck-to-docker
```
