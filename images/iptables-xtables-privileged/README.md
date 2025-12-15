# iptables-xtables-privileged

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#iptables-xtables-privileged

# Load into Docker
nix build .#load-iptables-xtables-privileged-to-docker && ./result/bin/load-iptables-xtables-privileged-to-docker
```
