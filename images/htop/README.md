# htop

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#htop

# Load into Docker
nix build .#load-htop-to-docker && ./result/bin/load-htop-to-docker
```
