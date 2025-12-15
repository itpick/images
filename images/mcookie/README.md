# mcookie

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mcookie

# Load into Docker
nix build .#load-mcookie-to-docker && ./result/bin/load-mcookie-to-docker
```
