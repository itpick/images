# ctr

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ctr

# Load into Docker
nix build .#load-ctr-to-docker && ./result/bin/load-ctr-to-docker
```
