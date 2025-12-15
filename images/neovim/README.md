# neovim

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#neovim

# Load into Docker
nix build .#load-neovim-to-docker && ./result/bin/load-neovim-to-docker
```
