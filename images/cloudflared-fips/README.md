# cloudflared-fips

Cloudflare Tunnel client (formerly Argo Tunnel)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cloudflared-fips

# Load into Docker
nix build .#load-cloudflared-fips-to-docker && ./result/bin/load-cloudflared-fips-to-docker
```
