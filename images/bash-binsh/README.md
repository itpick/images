# bash-binsh

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bash-binsh

# Load into Docker
nix build .#load-bash-binsh-to-docker && ./result/bin/load-bash-binsh-to-docker
```
