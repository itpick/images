# google-cloud-sdk-iamguarded-fips

Minimal IAMGuarded image with the Google Cloud SDK

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#google-cloud-sdk-iamguarded-fips

# Load into Docker
nix build .#load-google-cloud-sdk-iamguarded-fips-to-docker && ./result/bin/load-google-cloud-sdk-iamguarded-fips-to-docker
```
