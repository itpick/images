# tekton-pipelines-webhook-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-pipelines-webhook-fips

# Load into Docker
nix build .#load-tekton-pipelines-webhook-fips-to-docker && ./result/bin/load-tekton-pipelines-webhook-fips-to-docker
```
