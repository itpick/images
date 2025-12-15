# cortex-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cortex-fips

# Load into Docker
nix build .#load-cortex-fips-to-docker && ./result/bin/load-cortex-fips-to-docker
```
