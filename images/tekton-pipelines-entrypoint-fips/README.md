# tekton-pipelines-entrypoint-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-pipelines-entrypoint-fips

# Load into Docker
nix build .#load-tekton-pipelines-entrypoint-fips-to-docker && ./result/bin/load-tekton-pipelines-entrypoint-fips-to-docker
```
