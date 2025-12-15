# yunikorn-scheduler-fips

Apache YuniKorn K8shim

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#yunikorn-scheduler-fips

# Load into Docker
nix build .#load-yunikorn-scheduler-fips-to-docker && ./result/bin/load-yunikorn-scheduler-fips-to-docker
```
