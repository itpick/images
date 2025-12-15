# k8sgpt-operator

Minimal k8sgpt-operator container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k8sgpt-operator

# Load into Docker
nix build .#load-k8sgpt-operator-to-docker && ./result/bin/load-k8sgpt-operator-to-docker
```
