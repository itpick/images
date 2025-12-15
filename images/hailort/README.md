# hailort

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#hailort

# Load into Docker
nix build .#load-hailort-to-docker && ./result/bin/load-hailort-to-docker
```
