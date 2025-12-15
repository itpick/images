# python-3.13-privileged-netbindservice

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#python-3.13-privileged-netbindservice

# Load into Docker
nix build .#load-python-3.13-privileged-netbindservice-to-docker && ./result/bin/load-python-3.13-privileged-netbindservice-to-docker
```
