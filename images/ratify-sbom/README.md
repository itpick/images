# ratify-sbom

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ratify-sbom

# Load into Docker
nix build .#load-ratify-sbom-to-docker && ./result/bin/load-ratify-sbom-to-docker
```
