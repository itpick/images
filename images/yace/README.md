# yace

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#yace

# Load into Docker
nix build .#load-yace-to-docker && ./result/bin/load-yace-to-docker
```
