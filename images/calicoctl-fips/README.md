# calicoctl-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#calicoctl-fips

# Load into Docker
nix build .#load-calicoctl-fips-to-docker && ./result/bin/load-calicoctl-fips-to-docker
```
