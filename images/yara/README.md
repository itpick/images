# yara

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#yara

# Load into Docker
nix build .#load-yara-to-docker && ./result/bin/load-yara-to-docker
```
