# tekton-pipelines-sidecarlogresults

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-pipelines-sidecarlogresults

# Load into Docker
nix build .#load-tekton-pipelines-sidecarlogresults-to-docker && ./result/bin/load-tekton-pipelines-sidecarlogresults-to-docker
```
