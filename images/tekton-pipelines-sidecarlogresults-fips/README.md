# tekton-pipelines-sidecarlogresults-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-pipelines-sidecarlogresults-fips

# Load into Docker
nix build .#load-tekton-pipelines-sidecarlogresults-fips-to-docker && ./result/bin/load-tekton-pipelines-sidecarlogresults-fips-to-docker
```
