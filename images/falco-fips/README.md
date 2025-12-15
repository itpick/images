# falco-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#falco-fips

# Load into Docker
nix build .#load-falco-fips-to-docker && ./result/bin/load-falco-fips-to-docker
```
