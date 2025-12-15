# btop

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#btop

# Load into Docker
nix build .#load-btop-to-docker && ./result/bin/load-btop-to-docker
```
