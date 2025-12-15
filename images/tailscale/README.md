# tailscale

Tailscale is a WireGuard-based mesh VPN

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#tailscale

# Load into Docker
nix build .#load-tailscale-to-docker && ./result/bin/load-tailscale-to-docker
```
