# git-bootstrap

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#git-bootstrap

# Load into Docker
nix build .#load-git-bootstrap-to-docker && ./result/bin/load-git-bootstrap-to-docker
```
