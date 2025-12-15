# openpmix

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openpmix

# Load into Docker
nix build .#load-openpmix-to-docker && ./result/bin/load-openpmix-to-docker
```
