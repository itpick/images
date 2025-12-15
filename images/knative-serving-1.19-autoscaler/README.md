# knative-serving-1.19-autoscaler

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-serving-1.19-autoscaler

# Load into Docker
nix build .#load-knative-serving-1.19-autoscaler-to-docker && ./result/bin/load-knative-serving-1.19-autoscaler-to-docker
```
