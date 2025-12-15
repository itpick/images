# prom2json

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prom2json

# Load into Docker
nix build .#load-prom2json-to-docker && ./result/bin/load-prom2json-to-docker
```
