# oauth2-proxy

OAuth2 Proxy is a reverse proxy that provides authentication with Google, Azure, OpenID Connect and many more identity providers

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#oauth2-proxy

# Load into Docker
nix build .#load-oauth2-proxy-to-docker && ./result/bin/load-oauth2-proxy-to-docker
```
