# supervisor

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#supervisor

# Load into Docker
nix build .#load-supervisor-to-docker && ./result/bin/load-supervisor-to-docker
```
