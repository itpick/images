# crossplane-provider-gcp

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#crossplane-provider-gcp

# Load into Docker
nix build .#load-crossplane-provider-gcp-to-docker && ./result/bin/load-crossplane-provider-gcp-to-docker
```
