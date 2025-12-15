# temporal-server-oci-entrypoint-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#temporal-server-oci-entrypoint-fips

# Load into Docker
nix build .#load-temporal-server-oci-entrypoint-fips-to-docker && ./result/bin/load-temporal-server-oci-entrypoint-fips-to-docker
```
