# omnictl-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#omnictl-fips

# Load into Docker
nix build .#load-omnictl-fips-to-docker && ./result/bin/load-omnictl-fips-to-docker
```
