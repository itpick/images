# tekton-pipelines-events

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-pipelines-events

# Load into Docker
nix build .#load-tekton-pipelines-events-to-docker && ./result/bin/load-tekton-pipelines-events-to-docker
```
