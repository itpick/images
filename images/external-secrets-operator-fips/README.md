# external-secrets-operator-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#external-secrets-operator-fips

# Load into Docker
nix build .#load-external-secrets-operator-fips-to-docker && ./result/bin/load-external-secrets-operator-fips-to-docker
```
