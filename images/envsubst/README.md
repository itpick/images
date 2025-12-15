# envsubst

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#envsubst

# Load into Docker
nix build .#load-envsubst-to-docker && ./result/bin/load-envsubst-to-docker
```
