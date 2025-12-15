# mattermost-operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#mattermost-operator

# Load into Docker
nix build .#load-mattermost-operator-to-docker && ./result/bin/load-mattermost-operator-to-docker
```
