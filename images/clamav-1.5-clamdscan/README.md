# clamav-1.5-clamdscan

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#clamav-1.5-clamdscan

# Load into Docker
nix build .#load-clamav-1.5-clamdscan-to-docker && ./result/bin/load-clamav-1.5-clamdscan-to-docker
```
