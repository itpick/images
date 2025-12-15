# rancher-shell-fips

Minimal FIPS compliant kubectl and helm installer image for Rancher

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-shell-fips

# Load into Docker
nix build .#load-rancher-shell-fips-to-docker && ./result/bin/load-rancher-shell-fips-to-docker
```
