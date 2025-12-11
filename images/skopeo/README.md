# skopeo

Minimalist Wolfi-based skopeo image for interacting with container registries

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#skopeo

# Load into Docker
nix build .#load-skopeo-to-docker && ./result/bin/load-skopeo-to-docker
```
