# bpftool

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bpftool

# Load into Docker
nix build .#load-bpftool-to-docker && ./result/bin/load-bpftool-to-docker
```
