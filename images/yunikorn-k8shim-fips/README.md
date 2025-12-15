# yunikorn-k8shim-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#yunikorn-k8shim-fips

# Load into Docker
nix build .#load-yunikorn-k8shim-fips-to-docker && ./result/bin/load-yunikorn-k8shim-fips-to-docker
```
