# sigstore-scaffolding-getoidctoken

Minimal Wolfi-based Sigstore images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-getoidctoken

# Load into Docker
nix build .#load-sigstore-scaffolding-getoidctoken-to-docker && ./result/bin/load-sigstore-scaffolding-getoidctoken-to-docker
```
