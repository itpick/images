# policy-reporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#policy-reporter

# Load into Docker
nix build .#load-policy-reporter-to-docker && ./result/bin/load-policy-reporter-to-docker
```
