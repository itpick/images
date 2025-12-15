# rekor-fips-server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rekor-fips-server

# Load into Docker
nix build .#load-rekor-fips-server-to-docker && ./result/bin/load-rekor-fips-server-to-docker
```
