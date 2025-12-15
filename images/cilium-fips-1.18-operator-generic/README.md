# cilium-fips-1.18-operator-generic

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cilium-fips-1.18-operator-generic

# Load into Docker
nix build .#load-cilium-fips-1.18-operator-generic-to-docker && ./result/bin/load-cilium-fips-1.18-operator-generic-to-docker
```
