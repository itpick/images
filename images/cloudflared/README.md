# cloudflared

Cloudflare Tunnel client (formerly Argo Tunnel)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cloudflared

# Load into Docker
nix build .#load-cloudflared-to-docker && ./result/bin/load-cloudflared-to-docker
```
