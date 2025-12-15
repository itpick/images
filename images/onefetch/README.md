# onefetch

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#onefetch

# Load into Docker
nix build .#load-onefetch-to-docker && ./result/bin/load-onefetch-to-docker
```
