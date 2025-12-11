# snapshot-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#snapshot-controller

# Load into Docker
nix build .#load-snapshot-controller-to-docker && ./result/bin/load-snapshot-controller-to-docker
```
