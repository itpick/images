# shadow-subids

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#shadow-subids

# Load into Docker
nix build .#load-shadow-subids-to-docker && ./result/bin/load-shadow-subids-to-docker
```
