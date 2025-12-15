# sigstore-scaffolding-tuf-server

Minimal Wolfi-based Sigstore images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-tuf-server

# Load into Docker
nix build .#load-sigstore-scaffolding-tuf-server-to-docker && ./result/bin/load-sigstore-scaffolding-tuf-server-to-docker
```
