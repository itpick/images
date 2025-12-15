# clamav-1.5-milter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#clamav-1.5-milter

# Load into Docker
nix build .#load-clamav-1.5-milter-to-docker && ./result/bin/load-clamav-1.5-milter-to-docker
```
