# headlamp-fips

Minimal Fips image of Headlamp is an easy-to-use and extensible Kubernetes web UI designed for developers and cluster operators

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#headlamp-fips

# Load into Docker
nix build .#load-headlamp-fips-to-docker && ./result/bin/load-headlamp-fips-to-docker
```
