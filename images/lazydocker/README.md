# lazydocker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#lazydocker

# Load into Docker
nix build .#load-lazydocker-to-docker && ./result/bin/load-lazydocker-to-docker
```
