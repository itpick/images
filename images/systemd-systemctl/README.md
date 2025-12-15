# systemd-systemctl

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#systemd-systemctl

# Load into Docker
nix build .#load-systemd-systemctl-to-docker && ./result/bin/load-systemd-systemctl-to-docker
```
