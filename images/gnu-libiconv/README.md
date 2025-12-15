# gnu-libiconv

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gnu-libiconv

# Load into Docker
nix build .#load-gnu-libiconv-to-docker && ./result/bin/load-gnu-libiconv-to-docker
```
