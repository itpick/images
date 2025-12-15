# xkbcomp

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#xkbcomp

# Load into Docker
nix build .#load-xkbcomp-to-docker && ./result/bin/load-xkbcomp-to-docker
```
