# clamav-1.5-scanner

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#clamav-1.5-scanner

# Load into Docker
nix build .#load-clamav-1.5-scanner-to-docker && ./result/bin/load-clamav-1.5-scanner-to-docker
```
