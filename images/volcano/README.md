# volcano

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#volcano

# Load into Docker
nix build .#load-volcano-to-docker && ./result/bin/load-volcano-to-docker
```
