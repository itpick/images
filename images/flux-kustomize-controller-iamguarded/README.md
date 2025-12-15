# flux-kustomize-controller-iamguarded

minimal zero CVE flux images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flux-kustomize-controller-iamguarded

# Load into Docker
nix build .#load-flux-kustomize-controller-iamguarded-to-docker && ./result/bin/load-flux-kustomize-controller-iamguarded-to-docker
```
