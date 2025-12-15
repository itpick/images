# mcfly

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mcfly

# Load into Docker
nix build .#load-mcfly-to-docker && ./result/bin/load-mcfly-to-docker
```
