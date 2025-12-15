# google-cloud-sdk-core

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#google-cloud-sdk-core

# Load into Docker
nix build .#load-google-cloud-sdk-core-to-docker && ./result/bin/load-google-cloud-sdk-core-to-docker
```
