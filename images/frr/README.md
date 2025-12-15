# frr

The FRRouting Protocol Suite

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#frr

# Load into Docker
nix build .#load-frr-to-docker && ./result/bin/load-frr-to-docker
```
