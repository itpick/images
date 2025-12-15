# sigstore-scaffolding-trillian-createtree

Minimal Wolfi-based Sigstore images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-trillian-createtree

# Load into Docker
nix build .#load-sigstore-scaffolding-trillian-createtree-to-docker && ./result/bin/load-sigstore-scaffolding-trillian-createtree-to-docker
```
