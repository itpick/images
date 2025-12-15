# ratify-crds-fips

Artifact Ratification Framework (CNCF Sandbox)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ratify-crds-fips

# Load into Docker
nix build .#load-ratify-crds-fips-to-docker && ./result/bin/load-ratify-crds-fips-to-docker
```
