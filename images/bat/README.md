# bat

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bat

# Load into Docker
nix build .#load-bat-to-docker && ./result/bin/load-bat-to-docker
```
