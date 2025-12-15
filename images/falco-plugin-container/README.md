# falco-plugin-container

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#falco-plugin-container

# Load into Docker
nix build .#load-falco-plugin-container-to-docker && ./result/bin/load-falco-plugin-container-to-docker
```
