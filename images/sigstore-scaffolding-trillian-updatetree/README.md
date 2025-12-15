# sigstore-scaffolding-trillian-updatetree

Minimal Wolfi-based Sigstore images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-trillian-updatetree

# Load into Docker
nix build .#load-sigstore-scaffolding-trillian-updatetree-to-docker && ./result/bin/load-sigstore-scaffolding-trillian-updatetree-to-docker
```
