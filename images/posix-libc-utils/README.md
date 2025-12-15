# posix-libc-utils

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#posix-libc-utils

# Load into Docker
nix build .#load-posix-libc-utils-to-docker && ./result/bin/load-posix-libc-utils-to-docker
```
