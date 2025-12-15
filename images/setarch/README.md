# setarch

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#setarch

# Load into Docker
nix build .#load-setarch-to-docker && ./result/bin/load-setarch-to-docker
```
