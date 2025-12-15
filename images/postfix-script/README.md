# postfix-script

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postfix-script

# Load into Docker
nix build .#load-postfix-script-to-docker && ./result/bin/load-postfix-script-to-docker
```
