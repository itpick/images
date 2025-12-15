# sigstore-scaffolding-fips-tsa-createcertchain

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-fips-tsa-createcertchain

# Load into Docker
nix build .#load-sigstore-scaffolding-fips-tsa-createcertchain-to-docker && ./result/bin/load-sigstore-scaffolding-fips-tsa-createcertchain-to-docker
```
