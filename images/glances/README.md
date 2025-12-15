# glances

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#glances

# Load into Docker
nix build .#load-glances-to-docker && ./result/bin/load-glances-to-docker
```
