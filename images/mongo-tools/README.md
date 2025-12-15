# mongo-tools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mongo-tools

# Load into Docker
nix build .#load-mongo-tools-to-docker && ./result/bin/load-mongo-tools-to-docker
```
