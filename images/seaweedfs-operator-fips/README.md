# seaweedfs-operator-fips

seaweedfs kubernetes operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#seaweedfs-operator-fips

# Load into Docker
nix build .#load-seaweedfs-operator-fips-to-docker && ./result/bin/load-seaweedfs-operator-fips-to-docker
```
