# headlamp-plugin-flux-fips

Headlamp plugin to visualize and manage Flux GitOps resources in Kubernetes clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#headlamp-plugin-flux-fips

# Load into Docker
nix build .#load-headlamp-plugin-flux-fips-to-docker && ./result/bin/load-headlamp-plugin-flux-fips-to-docker
```
