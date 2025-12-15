# temporal-server-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#temporal-server-fips

# Load into Docker
nix build .#load-temporal-server-fips-to-docker && ./result/bin/load-temporal-server-fips-to-docker
```
