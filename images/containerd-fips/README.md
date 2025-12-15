# containerd-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#containerd-fips

# Load into Docker
nix build .#load-containerd-fips-to-docker && ./result/bin/load-containerd-fips-to-docker
```
