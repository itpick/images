# coder

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#coder

# Load into Docker
nix build .#load-coder-to-docker && ./result/bin/load-coder-to-docker
```
