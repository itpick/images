# tanka

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tanka

# Load into Docker
nix build .#load-tanka-to-docker && ./result/bin/load-tanka-to-docker
```
