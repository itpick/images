# flux-helm-controller-iamguarded

minimal zero CVE flux images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flux-helm-controller-iamguarded

# Load into Docker
nix build .#load-flux-helm-controller-iamguarded-to-docker && ./result/bin/load-flux-helm-controller-iamguarded-to-docker
```
