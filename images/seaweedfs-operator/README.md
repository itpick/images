# seaweedfs-operator

seaweedfs kubernetes operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#seaweedfs-operator

# Load into Docker
nix build .#load-seaweedfs-operator-to-docker && ./result/bin/load-seaweedfs-operator-to-docker
```
