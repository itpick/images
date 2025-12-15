# git-daemon

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#git-daemon

# Load into Docker
nix build .#load-git-daemon-to-docker && ./result/bin/load-git-daemon-to-docker
```
