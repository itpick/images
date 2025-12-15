# step-cli-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#step-cli-fips

# Load into Docker
nix build .#load-step-cli-fips-to-docker && ./result/bin/load-step-cli-fips-to-docker
```
