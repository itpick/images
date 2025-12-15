# calico-typhad

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#calico-typhad

# Load into Docker
nix build .#load-calico-typhad-to-docker && ./result/bin/load-calico-typhad-to-docker
```
