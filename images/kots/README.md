# kots

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kots

# Load into Docker
nix build .#load-kots-to-docker && ./result/bin/load-kots-to-docker
```
