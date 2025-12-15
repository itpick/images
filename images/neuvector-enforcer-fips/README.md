# neuvector-enforcer-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#neuvector-enforcer-fips

# Load into Docker
nix build .#load-neuvector-enforcer-fips-to-docker && ./result/bin/load-neuvector-enforcer-fips-to-docker
```
