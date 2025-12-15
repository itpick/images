# container-object-storage-interface-sidecar-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#container-object-storage-interface-sidecar-fips

# Load into Docker
nix build .#load-container-object-storage-interface-sidecar-fips-to-docker && ./result/bin/load-container-object-storage-interface-sidecar-fips-to-docker
```
