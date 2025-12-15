# harbor-scanner-trivy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#harbor-scanner-trivy

# Load into Docker
nix build .#load-harbor-scanner-trivy-to-docker && ./result/bin/load-harbor-scanner-trivy-to-docker
```
