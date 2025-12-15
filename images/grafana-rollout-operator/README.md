# grafana-rollout-operator

Kubernetes Rollout Operator coordinates the rollout of pods between different StatefulSets within a specific namespace, and can be used to manage multi-AZ deployments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#grafana-rollout-operator

# Load into Docker
nix build .#load-grafana-rollout-operator-to-docker && ./result/bin/load-grafana-rollout-operator-to-docker
```
