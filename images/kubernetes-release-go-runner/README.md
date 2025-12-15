# kubernetes-release-go-runner

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-release-go-runner

# Load into Docker
nix build .#load-kubernetes-release-go-runner-to-docker && ./result/bin/load-kubernetes-release-go-runner-to-docker
```
