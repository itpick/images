# tekton-pipelines-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-pipelines-controller

# Load into Docker
nix build .#load-tekton-pipelines-controller-to-docker && ./result/bin/load-tekton-pipelines-controller-to-docker
```
