# timescaledb-oci-entrypoint-pg17

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#timescaledb-oci-entrypoint-pg17

# Load into Docker
nix build .#load-timescaledb-oci-entrypoint-pg17-to-docker && ./result/bin/load-timescaledb-oci-entrypoint-pg17-to-docker
```
