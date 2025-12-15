# sqlpad-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sqlpad-fips

# Load into Docker
nix build .#load-sqlpad-fips-to-docker && ./result/bin/load-sqlpad-fips-to-docker
```
