# containers-storage

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#containers-storage

# Load into Docker
nix build .#load-containers-storage-to-docker && ./result/bin/load-containers-storage-to-docker
```
