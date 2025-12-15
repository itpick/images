# kong-fips

Kong is a Cloud-Native API Gateway and AI Gateway

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kong-fips

# Load into Docker
nix build .#load-kong-fips-to-docker && ./result/bin/load-kong-fips-to-docker
```
