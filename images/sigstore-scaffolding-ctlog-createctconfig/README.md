# sigstore-scaffolding-ctlog-createctconfig

Minimal Wolfi-based Sigstore images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-ctlog-createctconfig

# Load into Docker
nix build .#load-sigstore-scaffolding-ctlog-createctconfig-to-docker && ./result/bin/load-sigstore-scaffolding-ctlog-createctconfig-to-docker
```
