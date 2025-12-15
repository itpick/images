# kiam

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kiam

# Load into Docker
nix build .#load-kiam-to-docker && ./result/bin/load-kiam-to-docker
```
