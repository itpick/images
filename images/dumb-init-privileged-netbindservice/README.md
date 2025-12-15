# dumb-init-privileged-netbindservice

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dumb-init-privileged-netbindservice

# Load into Docker
nix build .#load-dumb-init-privileged-netbindservice-to-docker && ./result/bin/load-dumb-init-privileged-netbindservice-to-docker
```
