# systemd-boot

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#systemd-boot

# Load into Docker
nix build .#load-systemd-boot-to-docker && ./result/bin/load-systemd-boot-to-docker
```
