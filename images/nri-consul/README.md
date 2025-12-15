# nri-consul

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-consul

# Load into Docker
nix build .#load-nri-consul-to-docker && ./result/bin/load-nri-consul-to-docker
```
