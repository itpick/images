# policy-reporter-ui

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 21s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#policy-reporter-ui

# Load into Docker
nix build .#load-policy-reporter-ui-to-docker && ./result/bin/load-policy-reporter-ui-to-docker
```
