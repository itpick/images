# trivy-adapter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#trivy-adapter

# Load into Docker
nix build .#load-trivy-adapter-to-docker && ./result/bin/load-trivy-adapter-to-docker
```
