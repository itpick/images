# sigstore-scaffolding-ctlog-managectroots

Minimal Wolfi-based Sigstore images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-ctlog-managectroots

# Load into Docker
nix build .#load-sigstore-scaffolding-ctlog-managectroots-to-docker && ./result/bin/load-sigstore-scaffolding-ctlog-managectroots-to-docker
```
