# snapshot-validation-webhook

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#snapshot-validation-webhook

# Load into Docker
nix build .#load-snapshot-validation-webhook-to-docker && ./result/bin/load-snapshot-validation-webhook-to-docker
```
