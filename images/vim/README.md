# vim

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vim

# Load into Docker
nix build .#load-vim-to-docker && ./result/bin/load-vim-to-docker
```
