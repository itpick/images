# netcat-openbsd

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#netcat-openbsd

# Load into Docker
nix build .#load-netcat-openbsd-to-docker && ./result/bin/load-netcat-openbsd-to-docker
```
