# nist-esv

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nist-esv

# Load into Docker
nix build .#load-nist-esv-to-docker && ./result/bin/load-nist-esv-to-docker
```
