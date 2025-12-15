# terraform-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#terraform-fips

# Load into Docker
nix build .#load-terraform-fips-to-docker && ./result/bin/load-terraform-fips-to-docker
```
