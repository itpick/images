# python-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#python-fips

# Load into Docker
nix build .#load-python-fips-to-docker && ./result/bin/load-python-fips-to-docker
```
