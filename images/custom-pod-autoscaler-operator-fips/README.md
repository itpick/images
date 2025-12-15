# custom-pod-autoscaler-operator-fips

Operator for managing Kubernetes Custom Pod Autoscalers (CPA)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#custom-pod-autoscaler-operator-fips

# Load into Docker
nix build .#load-custom-pod-autoscaler-operator-fips-to-docker && ./result/bin/load-custom-pod-autoscaler-operator-fips-to-docker
```
