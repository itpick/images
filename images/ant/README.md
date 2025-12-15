# ant

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#ant

# Load into Docker
nix build .#load-ant-to-docker && ./result/bin/load-ant-to-docker
```
