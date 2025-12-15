# dash-binsh

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dash-binsh

# Load into Docker
nix build .#load-dash-binsh-to-docker && ./result/bin/load-dash-binsh-to-docker
```
