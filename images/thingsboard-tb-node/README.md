# thingsboard-tb-node

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#thingsboard-tb-node

# Load into Docker
nix build .#load-thingsboard-tb-node-to-docker && ./result/bin/load-thingsboard-tb-node-to-docker
```
