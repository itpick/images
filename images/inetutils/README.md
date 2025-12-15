# inetutils

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#inetutils

# Load into Docker
nix build .#load-inetutils-to-docker && ./result/bin/load-inetutils-to-docker
```
