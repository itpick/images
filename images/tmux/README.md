# tmux

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tmux

# Load into Docker
nix build .#load-tmux-to-docker && ./result/bin/load-tmux-to-docker
```
