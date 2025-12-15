# helm-mapkubeapis

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#helm-mapkubeapis

# Load into Docker
nix build .#load-helm-mapkubeapis-to-docker && ./result/bin/load-helm-mapkubeapis-to-docker
```
