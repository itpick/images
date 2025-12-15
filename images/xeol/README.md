# xeol

A scanner for end-of-life (EOL) software and dependencies in container images, filesystems, and SBOMs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#xeol

# Load into Docker
nix build .#load-xeol-to-docker && ./result/bin/load-xeol-to-docker
```
