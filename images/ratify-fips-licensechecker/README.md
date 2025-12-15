# ratify-fips-licensechecker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ratify-fips-licensechecker

# Load into Docker
nix build .#load-ratify-fips-licensechecker-to-docker && ./result/bin/load-ratify-fips-licensechecker-to-docker
```
