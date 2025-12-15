# sigstore-scaffolding-fulcio-createcerts

Minimal Wolfi-based Sigstore images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-fulcio-createcerts

# Load into Docker
nix build .#load-sigstore-scaffolding-fulcio-createcerts-to-docker && ./result/bin/load-sigstore-scaffolding-fulcio-createcerts-to-docker
```
