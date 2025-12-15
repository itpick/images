# falco

A minimal, wolfi-based image for falco. This streamlined variant of Falco designed for real-time security monitoring on Linux, replaces the traditional kernel module with eBPF technology, thus enhancing portability in containerized environments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#falco

# Load into Docker
nix build .#load-falco-to-docker && ./result/bin/load-falco-to-docker
```
