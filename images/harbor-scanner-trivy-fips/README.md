# harbor-scanner-trivy-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#harbor-scanner-trivy-fips

# Load into Docker
nix build .#load-harbor-scanner-trivy-fips-to-docker && ./result/bin/load-harbor-scanner-trivy-fips-to-docker
```
