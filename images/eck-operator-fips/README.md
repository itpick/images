# eck-operator-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#eck-operator-fips

# Load into Docker
nix build .#load-eck-operator-fips-to-docker && ./result/bin/load-eck-operator-fips-to-docker
```
