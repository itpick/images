# harbor-fips-2.14-registryctl

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#harbor-fips-2.14-registryctl

# Load into Docker
nix build .#load-harbor-fips-2.14-registryctl-to-docker && ./result/bin/load-harbor-fips-2.14-registryctl-to-docker
```
