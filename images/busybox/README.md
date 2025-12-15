# busybox

Container image with only busybox and libc (available in both musl and glibc variants). Suitable for running any binaries that only have a dependency on glibc/musl

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#busybox

# Load into Docker
nix build .#load-busybox-to-docker && ./result/bin/load-busybox-to-docker
```
