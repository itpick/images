# volume-modifier-for-k8s

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#volume-modifier-for-k8s

# Load into Docker
nix build .#load-volume-modifier-for-k8s-to-docker && ./result/bin/load-volume-modifier-for-k8s-to-docker
```
