# sqlite

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#sqlite

# Load into Docker
nix build .#load-sqlite-to-docker && ./result/bin/load-sqlite-to-docker
```
