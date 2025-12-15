# linkerd2-cni-repair-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#linkerd2-cni-repair-controller

# Load into Docker
nix build .#load-linkerd2-cni-repair-controller-to-docker && ./result/bin/load-linkerd2-cni-repair-controller-to-docker
```
