# tini-static

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tini-static

# Load into Docker
nix build .#load-tini-static-to-docker && ./result/bin/load-tini-static-to-docker
```
