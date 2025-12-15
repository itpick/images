# bind-tools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bind-tools

# Load into Docker
nix build .#load-bind-tools-to-docker && ./result/bin/load-bind-tools-to-docker
```
