# yunikorn-web-fips

Apache YuniKorn Web UI

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#yunikorn-web-fips

# Load into Docker
nix build .#load-yunikorn-web-fips-to-docker && ./result/bin/load-yunikorn-web-fips-to-docker
```
