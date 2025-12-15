# iptables-wrappers

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#iptables-wrappers

# Load into Docker
nix build .#load-iptables-wrappers-to-docker && ./result/bin/load-iptables-wrappers-to-docker
```
