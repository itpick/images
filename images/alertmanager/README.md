# alertmanager

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#alertmanager

# Load into Docker
nix build .#load-alertmanager-to-docker && ./result/bin/load-alertmanager-to-docker
```
