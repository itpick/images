# pdns-recursor

PowerDNS Recursor is a non authoritative/recursing DNS server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pdns-recursor

# Load into Docker
nix build .#load-pdns-recursor-to-docker && ./result/bin/load-pdns-recursor-to-docker
```
