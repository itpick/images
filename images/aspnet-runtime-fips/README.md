# aspnet-runtime-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aspnet-runtime-fips

# Load into Docker
nix build .#load-aspnet-runtime-fips-to-docker && ./result/bin/load-aspnet-runtime-fips-to-docker
```
