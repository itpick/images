# notification-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#notification-controller

# Load into Docker
nix build .#load-notification-controller-to-docker && ./result/bin/load-notification-controller-to-docker
```
