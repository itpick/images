# gitlab-toolbox

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#gitlab-toolbox

# Load into Docker
nix build .#load-gitlab-toolbox-to-docker && ./result/bin/load-gitlab-toolbox-to-docker
```
