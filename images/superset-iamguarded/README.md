# superset-iamguarded

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#superset-iamguarded

# Load into Docker
nix build .#load-superset-iamguarded-to-docker && ./result/bin/load-superset-iamguarded-to-docker
```
