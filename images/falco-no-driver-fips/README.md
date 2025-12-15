# falco-no-driver-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#falco-no-driver-fips

# Load into Docker
nix build .#load-falco-no-driver-fips-to-docker && ./result/bin/load-falco-no-driver-fips-to-docker
```
