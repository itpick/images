# gogatekeeper

Minimalist Wolfi-based image of Gatekeeper, an OpenID / Proxy service

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gogatekeeper

# Load into Docker
nix build .#load-gogatekeeper-to-docker && ./result/bin/load-gogatekeeper-to-docker
```
