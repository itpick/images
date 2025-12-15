# rancher-kontainer-driver-metadata

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-kontainer-driver-metadata

# Load into Docker
nix build .#load-rancher-kontainer-driver-metadata-to-docker && ./result/bin/load-rancher-kontainer-driver-metadata-to-docker
```
