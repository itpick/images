# tekton-pipelines-nop-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-pipelines-nop-fips

# Load into Docker
nix build .#load-tekton-pipelines-nop-fips-to-docker && ./result/bin/load-tekton-pipelines-nop-fips-to-docker
```
