# flux

flux cli to interact with the Flux gitops toolkit components in a running cluster

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 306.07 MB |
| Uncompressed | ~765.18 MB |

## Usage

```bash
# Build the image
nix build .#flux

# Load into Docker
nix build .#load-flux-to-docker && ./result/bin/load-flux-to-docker
```
