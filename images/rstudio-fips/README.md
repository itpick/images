# rstudio-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rstudio-fips

# Load into Docker
nix build .#load-rstudio-fips-to-docker && ./result/bin/load-rstudio-fips-to-docker
```
