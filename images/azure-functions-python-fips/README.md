# azure-functions-python-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#azure-functions-python-fips

# Load into Docker
nix build .#load-azure-functions-python-fips-to-docker && ./result/bin/load-azure-functions-python-fips-to-docker
```
