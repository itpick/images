# kubernetes-dashboard-auth-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-dashboard-auth-fips

# Load into Docker
nix build .#load-kubernetes-dashboard-auth-fips-to-docker && ./result/bin/load-kubernetes-dashboard-auth-fips-to-docker
```
