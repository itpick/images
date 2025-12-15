# delta

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#delta

# Load into Docker
nix build .#load-delta-to-docker && ./result/bin/load-delta-to-docker
```
