# sops-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sops-fips

# Load into Docker
nix build .#load-sops-fips-to-docker && ./result/bin/load-sops-fips-to-docker
```
