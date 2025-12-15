# external-dns-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#external-dns-fips

# Load into Docker
nix build .#load-external-dns-fips-to-docker && ./result/bin/load-external-dns-fips-to-docker
```
