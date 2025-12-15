# iptables

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#iptables

# Load into Docker
nix build .#load-iptables-to-docker && ./result/bin/load-iptables-to-docker
```
