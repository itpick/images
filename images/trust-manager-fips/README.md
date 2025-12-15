# trust-manager-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#trust-manager-fips

# Load into Docker
nix build .#load-trust-manager-fips-to-docker && ./result/bin/load-trust-manager-fips-to-docker
```
