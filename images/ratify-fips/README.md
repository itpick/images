# ratify-fips

Artifact Ratification Framework (CNCF Sandbox)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ratify-fips

# Load into Docker
nix build .#load-ratify-fips-to-docker && ./result/bin/load-ratify-fips-to-docker
```
