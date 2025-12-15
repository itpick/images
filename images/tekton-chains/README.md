# tekton-chains

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-chains

# Load into Docker
nix build .#load-tekton-chains-to-docker && ./result/bin/load-tekton-chains-to-docker
```
