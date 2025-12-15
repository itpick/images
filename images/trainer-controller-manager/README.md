# trainer-controller-manager

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#trainer-controller-manager

# Load into Docker
nix build .#load-trainer-controller-manager-to-docker && ./result/bin/load-trainer-controller-manager-to-docker
```
