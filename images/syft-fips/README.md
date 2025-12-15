# syft-fips

A tool for generating a Software Bill of Materials (SBOM) from container images and filesystems

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#syft-fips

# Load into Docker
nix build .#load-syft-fips-to-docker && ./result/bin/load-syft-fips-to-docker
```
