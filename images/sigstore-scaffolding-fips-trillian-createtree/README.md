# sigstore-scaffolding-fips-trillian-createtree

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-fips-trillian-createtree

# Load into Docker
nix build .#load-sigstore-scaffolding-fips-trillian-createtree-to-docker && ./result/bin/load-sigstore-scaffolding-fips-trillian-createtree-to-docker
```
