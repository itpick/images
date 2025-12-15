# kserve-storage-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kserve-storage-controller

# Load into Docker
nix build .#load-kserve-storage-controller-to-docker && ./result/bin/load-kserve-storage-controller-to-docker
```
