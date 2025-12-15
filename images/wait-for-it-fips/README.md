# wait-for-it-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#wait-for-it-fips

# Load into Docker
nix build .#load-wait-for-it-fips-to-docker && ./result/bin/load-wait-for-it-fips-to-docker
```
