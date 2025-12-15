# buck2

Minimal image with buck2 build system binaries and toolchain

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#buck2

# Load into Docker
nix build .#load-buck2-to-docker && ./result/bin/load-buck2-to-docker
```
