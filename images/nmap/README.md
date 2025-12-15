# nmap

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nmap

# Load into Docker
nix build .#load-nmap-to-docker && ./result/bin/load-nmap-to-docker
```
