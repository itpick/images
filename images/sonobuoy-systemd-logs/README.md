# sonobuoy-systemd-logs

This is a simple standalone container that gathers log information from systemd, by chrooting into the node's filesystem and running journalctl

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sonobuoy-systemd-logs

# Load into Docker
nix build .#load-sonobuoy-systemd-logs-to-docker && ./result/bin/load-sonobuoy-systemd-logs-to-docker
```
