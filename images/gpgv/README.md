# gpgv

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gpgv

# Load into Docker
nix build .#load-gpgv-to-docker && ./result/bin/load-gpgv-to-docker
```
