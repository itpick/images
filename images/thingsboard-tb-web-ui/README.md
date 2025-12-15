# thingsboard-tb-web-ui

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#thingsboard-tb-web-ui

# Load into Docker
nix build .#load-thingsboard-tb-web-ui-to-docker && ./result/bin/load-thingsboard-tb-web-ui-to-docker
```
