# nri-haproxy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-haproxy

# Load into Docker
nix build .#load-nri-haproxy-to-docker && ./result/bin/load-nri-haproxy-to-docker
```
