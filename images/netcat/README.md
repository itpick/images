# netcat

Minimal image for Debian port of OpenBSD's netcat

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#netcat

# Load into Docker
nix build .#load-netcat-to-docker && ./result/bin/load-netcat-to-docker
```
