# spire-oidc-discovery-provider

Minimalist Wolfi-based spire images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spire-oidc-discovery-provider

# Load into Docker
nix build .#load-spire-oidc-discovery-provider-to-docker && ./result/bin/load-spire-oidc-discovery-provider-to-docker
```
