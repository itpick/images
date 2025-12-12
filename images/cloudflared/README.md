# cloudflared

Cloudflare Tunnel client (formerly Argo Tunnel)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 143.49 MB |
| Uncompressed | ~358.73 MB |

## Usage

```bash
# Build the image
nix build .#cloudflared

# Load into Docker
nix build .#load-cloudflared-to-docker && ./result/bin/load-cloudflared-to-docker
```
