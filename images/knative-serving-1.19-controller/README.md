# knative-serving-1.19-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-serving-1.19-controller

# Load into Docker
nix build .#load-knative-serving-1.19-controller-to-docker && ./result/bin/load-knative-serving-1.19-controller-to-docker
```
