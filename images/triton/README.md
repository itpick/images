# triton

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#triton

# Load into Docker
nix build .#load-triton-to-docker && ./result/bin/load-triton-to-docker
```
