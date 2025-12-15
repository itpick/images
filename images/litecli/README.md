# litecli

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#litecli

# Load into Docker
nix build .#load-litecli-to-docker && ./result/bin/load-litecli-to-docker
```
