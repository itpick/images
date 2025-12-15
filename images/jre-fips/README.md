# jre-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jre-fips

# Load into Docker
nix build .#load-jre-fips-to-docker && ./result/bin/load-jre-fips-to-docker
```
