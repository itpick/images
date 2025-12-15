# sigstore-scaffolding-rekor-createsecret

Minimal Wolfi-based Sigstore images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-rekor-createsecret

# Load into Docker
nix build .#load-sigstore-scaffolding-rekor-createsecret-to-docker && ./result/bin/load-sigstore-scaffolding-rekor-createsecret-to-docker
```
