# kyverno-init-container-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kyverno-init-container-fips

# Load into Docker
nix build .#load-kyverno-init-container-fips-to-docker && ./result/bin/load-kyverno-init-container-fips-to-docker
```
