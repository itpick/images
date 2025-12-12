# falcoctl

Minimalist Wolfi-based image for falcoctl

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 370.39 MB |
| Uncompressed | ~925.99 MB |

## Usage

```bash
# Build the image
nix build .#falcoctl

# Load into Docker
nix build .#load-falcoctl-to-docker && ./result/bin/load-falcoctl-to-docker
```
