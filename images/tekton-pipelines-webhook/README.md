# tekton-pipelines-webhook

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-pipelines-webhook

# Load into Docker
nix build .#load-tekton-pipelines-webhook-to-docker && ./result/bin/load-tekton-pipelines-webhook-to-docker
```
