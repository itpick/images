# promitor

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#promitor

# Load into Docker
nix build .#load-promitor-to-docker && ./result/bin/load-promitor-to-docker
```
