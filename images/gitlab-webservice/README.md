# gitlab-webservice

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#gitlab-webservice

# Load into Docker
nix build .#load-gitlab-webservice-to-docker && ./result/bin/load-gitlab-webservice-to-docker
```
