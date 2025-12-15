# tekton-pipelines-workingdirinit-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-pipelines-workingdirinit-fips

# Load into Docker
nix build .#load-tekton-pipelines-workingdirinit-fips-to-docker && ./result/bin/load-tekton-pipelines-workingdirinit-fips-to-docker
```
