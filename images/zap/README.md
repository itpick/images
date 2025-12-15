# zap

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#zap

# Load into Docker
nix build .#load-zap-to-docker && ./result/bin/load-zap-to-docker
```
