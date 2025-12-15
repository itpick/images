# bash-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bash-fips

# Load into Docker
nix build .#load-bash-fips-to-docker && ./result/bin/load-bash-fips-to-docker
```
