# distribution-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#distribution-fips

# Load into Docker
nix build .#load-distribution-fips-to-docker && ./result/bin/load-distribution-fips-to-docker
```
