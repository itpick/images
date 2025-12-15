# lsd

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#lsd

# Load into Docker
nix build .#load-lsd-to-docker && ./result/bin/load-lsd-to-docker
```
