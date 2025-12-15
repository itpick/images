# bash

Container image with only Bash and libc. Suitable for running any small scripts or binaries that need Bash instead of the BusyBox shell

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#bash

# Load into Docker
nix build .#load-bash-to-docker && ./result/bin/load-bash-to-docker
```
