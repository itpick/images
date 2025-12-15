# rclone-fips

Rclone syncs files and directories to and from different cloud storage providers

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rclone-fips

# Load into Docker
nix build .#load-rclone-fips-to-docker && ./result/bin/load-rclone-fips-to-docker
```
