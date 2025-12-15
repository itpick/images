# k8s-agents-operator

k8s-agents-operator auto-instruments containerized workloads in Kubernetes with New Relic agents

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k8s-agents-operator

# Load into Docker
nix build .#load-k8s-agents-operator-to-docker && ./result/bin/load-k8s-agents-operator-to-docker
```
