# grafana-rollout-operator-fips

Kubernetes Rollout Operator coordinates the rollout of pods between different StatefulSets within a specific namespace, and can be used to manage multi-AZ deployments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#grafana-rollout-operator-fips

# Load into Docker
nix build .#load-grafana-rollout-operator-fips-to-docker && ./result/bin/load-grafana-rollout-operator-fips-to-docker
```
