# explainer-dashboard

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 15s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 1023.11 MB |
| Uncompressed | ~2.49 GB |

## Usage

```bash
# Build the image
nix build .#explainer-dashboard

# Load into Docker
nix build .#load-explainer-dashboard-to-docker && ./result/bin/load-explainer-dashboard-to-docker
```
