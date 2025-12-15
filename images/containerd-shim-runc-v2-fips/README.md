# containerd-shim-runc-v2-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#containerd-shim-runc-v2-fips

# Load into Docker
nix build .#load-containerd-shim-runc-v2-fips-to-docker && ./result/bin/load-containerd-shim-runc-v2-fips-to-docker
```
