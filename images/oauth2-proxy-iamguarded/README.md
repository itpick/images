# oauth2-proxy-iamguarded

OAuth2 Proxy is a reverse proxy that provides authentication with Google, Azure, OpenID Connect and many more identity providers

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#oauth2-proxy-iamguarded

# Load into Docker
nix build .#load-oauth2-proxy-iamguarded-to-docker && ./result/bin/load-oauth2-proxy-iamguarded-to-docker
```
