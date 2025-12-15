# karma

A dashboard for managing alerts from Alertmanager

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#karma

# Load into Docker
nix build .#load-karma-to-docker && ./result/bin/load-karma-to-docker
```
