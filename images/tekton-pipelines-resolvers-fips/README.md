# tekton-pipelines-resolvers-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-pipelines-resolvers-fips

# Load into Docker
nix build .#load-tekton-pipelines-resolvers-fips-to-docker && ./result/bin/load-tekton-pipelines-resolvers-fips-to-docker
```
