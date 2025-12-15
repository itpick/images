# sigstore-scaffolding-fips-fulcio-createcerts

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-fips-fulcio-createcerts

# Load into Docker
nix build .#load-sigstore-scaffolding-fips-fulcio-createcerts-to-docker && ./result/bin/load-sigstore-scaffolding-fips-fulcio-createcerts-to-docker
```
