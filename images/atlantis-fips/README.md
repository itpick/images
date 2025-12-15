# atlantis-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#atlantis-fips

# Load into Docker
nix build .#load-atlantis-fips-to-docker && ./result/bin/load-atlantis-fips-to-docker
```
