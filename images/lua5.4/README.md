# lua5.4

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#lua5.4

# Load into Docker
nix build .#load-lua5.4-to-docker && ./result/bin/load-lua5.4-to-docker
```
