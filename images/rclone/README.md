# rclone

Rclone syncs files and directories to and from different cloud storage providers

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#rclone

# Load into Docker
nix build .#load-rclone-to-docker && ./result/bin/load-rclone-to-docker
```
