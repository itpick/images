# msttcorefonts-installer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#msttcorefonts-installer

# Load into Docker
nix build .#load-msttcorefonts-installer-to-docker && ./result/bin/load-msttcorefonts-installer-to-docker
```
