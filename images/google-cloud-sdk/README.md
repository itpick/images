# google-cloud-sdk

Minimal image with the Google Cloud SDK

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#google-cloud-sdk

# Load into Docker
nix build .#load-google-cloud-sdk-to-docker && ./result/bin/load-google-cloud-sdk-to-docker
```
