# hubble-ui

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1m 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#hubble-ui

# Load into Docker
nix build .#load-hubble-ui-to-docker && ./result/bin/load-hubble-ui-to-docker
```
