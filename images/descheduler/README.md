# descheduler

Kubernetes Descheduler is a tool that evicts pods from nodes based on configurable policies to improve cluster balance, resource utilization, and scheduling efficiency

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#descheduler

# Load into Docker
nix build .#load-descheduler-to-docker && ./result/bin/load-descheduler-to-docker
```
