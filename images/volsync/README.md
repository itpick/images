# volsync

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#volsync

# Load into Docker
nix build .#load-volsync-to-docker && ./result/bin/load-volsync-to-docker
```
