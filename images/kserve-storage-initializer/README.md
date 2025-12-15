# kserve-storage-initializer

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kserve-storage-initializer

# Load into Docker
nix build .#load-kserve-storage-initializer-to-docker && ./result/bin/load-kserve-storage-initializer-to-docker
```
