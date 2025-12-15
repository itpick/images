# dstat

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dstat

# Load into Docker
nix build .#load-dstat-to-docker && ./result/bin/load-dstat-to-docker
```
