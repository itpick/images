# rabbitmq-default-user-credential-updater-fips

Minimal FIPS compliant image with default-user-credential-updater

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rabbitmq-default-user-credential-updater-fips

# Load into Docker
nix build .#load-rabbitmq-default-user-credential-updater-fips-to-docker && ./result/bin/load-rabbitmq-default-user-credential-updater-fips-to-docker
```
