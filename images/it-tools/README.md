# it-tools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#it-tools

# Load into Docker
nix build .#load-it-tools-to-docker && ./result/bin/load-it-tools-to-docker
```
