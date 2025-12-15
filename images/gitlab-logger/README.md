# gitlab-logger

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitlab-logger

# Load into Docker
nix build .#load-gitlab-logger-to-docker && ./result/bin/load-gitlab-logger-to-docker
```
