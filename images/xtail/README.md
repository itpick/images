# xtail

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#xtail

# Load into Docker
nix build .#load-xtail-to-docker && ./result/bin/load-xtail-to-docker
```
