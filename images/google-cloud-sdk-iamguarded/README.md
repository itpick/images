# google-cloud-sdk-iamguarded

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#google-cloud-sdk-iamguarded

# Load into Docker
nix build .#load-google-cloud-sdk-iamguarded-to-docker && ./result/bin/load-google-cloud-sdk-iamguarded-to-docker
```
