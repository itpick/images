# gitlab

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitlab

# Load into Docker
nix build .#load-gitlab-to-docker && ./result/bin/load-gitlab-to-docker
```
