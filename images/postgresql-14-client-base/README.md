# postgresql-14-client-base

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgresql-14-client-base

# Load into Docker
nix build .#load-postgresql-14-client-base-to-docker && ./result/bin/load-postgresql-14-client-base-to-docker
```
