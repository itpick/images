# kubeseal

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeseal

# Load into Docker
nix build .#load-kubeseal-to-docker && ./result/bin/load-kubeseal-to-docker
```
