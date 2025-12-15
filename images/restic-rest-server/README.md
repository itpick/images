# restic-rest-server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#restic-rest-server

# Load into Docker
nix build .#load-restic-rest-server-to-docker && ./result/bin/load-restic-rest-server-to-docker
```
