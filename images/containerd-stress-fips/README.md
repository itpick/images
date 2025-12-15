# containerd-stress-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#containerd-stress-fips

# Load into Docker
nix build .#load-containerd-stress-fips-to-docker && ./result/bin/load-containerd-stress-fips-to-docker
```
