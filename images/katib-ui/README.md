# katib-ui

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#katib-ui

# Load into Docker
nix build .#load-katib-ui-to-docker && ./result/bin/load-katib-ui-to-docker
```
