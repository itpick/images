# tekton-pipelines-events-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-pipelines-events-fips

# Load into Docker
nix build .#load-tekton-pipelines-events-fips-to-docker && ./result/bin/load-tekton-pipelines-events-fips-to-docker
```
