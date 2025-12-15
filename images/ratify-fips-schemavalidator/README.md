# ratify-fips-schemavalidator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ratify-fips-schemavalidator

# Load into Docker
nix build .#load-ratify-fips-schemavalidator-to-docker && ./result/bin/load-ratify-fips-schemavalidator-to-docker
```
