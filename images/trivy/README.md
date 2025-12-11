# trivy

Last changed 2 days ago

FIPS available
Request a free trial

Contact our team to test out this image for free.

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#trivy

# Load into Docker
nix build .#load-trivy-to-docker && ./result/bin/load-trivy-to-docker
```
