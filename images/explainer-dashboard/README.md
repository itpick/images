# explainer-dashboard

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#explainer-dashboard

# Load into Docker
nix build .#load-explainer-dashboard-to-docker && ./result/bin/load-explainer-dashboard-to-docker
```
