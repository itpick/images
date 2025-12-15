# crossplane-provider-gcp-container

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-provider-gcp-container

# Load into Docker
nix build .#load-crossplane-provider-gcp-container-to-docker && ./result/bin/load-crossplane-provider-gcp-container-to-docker
```
