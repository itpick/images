# syft

A tool for generating a Software Bill of Materials (SBOM) from container images and filesystems

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#syft

# Load into Docker
nix build .#load-syft-to-docker && ./result/bin/load-syft-to-docker
```
