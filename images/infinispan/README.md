# infinispan

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#infinispan

# Load into Docker
nix build .#load-infinispan-to-docker && ./result/bin/load-infinispan-to-docker
```
