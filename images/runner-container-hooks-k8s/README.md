# runner-container-hooks-k8s

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#runner-container-hooks-k8s

# Load into Docker
nix build .#load-runner-container-hooks-k8s-to-docker && ./result/bin/load-runner-container-hooks-k8s-to-docker
```
