# rpk

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rpk

# Load into Docker
nix build .#load-rpk-to-docker && ./result/bin/load-rpk-to-docker
```
