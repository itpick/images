# infinispan-15.2-images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#infinispan-15.2-images

# Load into Docker
nix build .#load-infinispan-15.2-images-to-docker && ./result/bin/load-infinispan-15.2-images-to-docker
```
