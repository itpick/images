# kubeflow-pipelines-persistence_agent

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-pipelines-persistence_agent

# Load into Docker
nix build .#load-kubeflow-pipelines-persistence_agent-to-docker && ./result/bin/load-kubeflow-pipelines-persistence_agent-to-docker
```
