# renovate

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 10s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#renovate

# Load into Docker
nix build .#load-renovate-to-docker && ./result/bin/load-renovate-to-docker
```
