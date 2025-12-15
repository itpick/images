# render-template

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#render-template

# Load into Docker
nix build .#load-render-template-to-docker && ./result/bin/load-render-template-to-docker
```
