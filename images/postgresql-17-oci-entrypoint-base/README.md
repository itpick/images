# postgresql-17-oci-entrypoint-base

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgresql-17-oci-entrypoint-base

# Load into Docker
nix build .#load-postgresql-17-oci-entrypoint-base-to-docker && ./result/bin/load-postgresql-17-oci-entrypoint-base-to-docker
```
