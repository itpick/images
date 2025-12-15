# tektoncd-cli

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#tektoncd-cli

# Load into Docker
nix build .#load-tektoncd-cli-to-docker && ./result/bin/load-tektoncd-cli-to-docker
```
