# keda-admission-webhooks

Minimal image with the Keda binary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#keda-admission-webhooks

# Load into Docker
nix build .#load-keda-admission-webhooks-to-docker && ./result/bin/load-keda-admission-webhooks-to-docker
```
