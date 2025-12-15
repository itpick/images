# pgwatch

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pgwatch

# Load into Docker
nix build .#load-pgwatch-to-docker && ./result/bin/load-pgwatch-to-docker
```
