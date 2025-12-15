# falco-no-driver

A minimal, wolfi-based image for falco-no-driver. This streamlined variant of Falco designed for real-time security monitoring on Linux, replaces the traditional kernel module with eBPF technology, thus enhancing portability in containerized environments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#falco-no-driver

# Load into Docker
nix build .#load-falco-no-driver-to-docker && ./result/bin/load-falco-no-driver-to-docker
```
