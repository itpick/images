# exim

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#exim

# Load into Docker
nix build .#load-exim-to-docker && ./result/bin/load-exim-to-docker
```
