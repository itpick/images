# restic

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#restic

# Load into Docker
nix build .#load-restic-to-docker && ./result/bin/load-restic-to-docker
```
