# ripgrep

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ripgrep

# Load into Docker
nix build .#load-ripgrep-to-docker && ./result/bin/load-ripgrep-to-docker
```
