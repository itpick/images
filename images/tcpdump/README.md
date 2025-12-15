# tcpdump

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tcpdump

# Load into Docker
nix build .#load-tcpdump-to-docker && ./result/bin/load-tcpdump-to-docker
```
