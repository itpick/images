# pixiecore

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pixiecore

# Load into Docker
nix build .#load-pixiecore-to-docker && ./result/bin/load-pixiecore-to-docker
```
