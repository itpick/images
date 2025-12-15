# gitui

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitui

# Load into Docker
nix build .#load-gitui-to-docker && ./result/bin/load-gitui-to-docker
```
