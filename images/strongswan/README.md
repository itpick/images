# strongswan

strongSwan is an OpenSource IPsec-based VPN solution

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#strongswan

# Load into Docker
nix build .#load-strongswan-to-docker && ./result/bin/load-strongswan-to-docker
```
