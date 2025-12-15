# kcat

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kcat

# Load into Docker
nix build .#load-kcat-to-docker && ./result/bin/load-kcat-to-docker
```
