# keda-fips-2.18-admission-webhooks

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#keda-fips-2.18-admission-webhooks

# Load into Docker
nix build .#load-keda-fips-2.18-admission-webhooks-to-docker && ./result/bin/load-keda-fips-2.18-admission-webhooks-to-docker
```
